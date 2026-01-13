import 'package:firebase_auth/firebase_auth.dart';
import 'package:greengrocer/scr/models/models.dart';
import 'package:greengrocer/scr/pages/auth/auth.dart';
import 'package:greengrocer/scr/services/services.dart';

class AuthRepository {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final FirestoreService _firestoreService = FirestoreService();

  AuthResult _handleFirebaseAuthError(FirebaseAuthException e) {
    String message;

    switch (e.code) {
      case 'user-not-found':
        message = 'Usuário não encontrado. Verifique o email digitado.';
        break;
      case 'wrong-password':
        message = 'Senha incorreta. Tente novamente.';
        break;
      case 'email-already-in-use':
        message = 'Este email já está cadastrado.';
        break;
      case 'invalid-email':
        message = 'Email inválido.';
        break;
      case 'weak-password':
        message = 'A senha deve ter no mínimo 6 caracteres.';
        break;
      case 'user-disabled':
        message = 'Esta conta foi desabilitada.';
        break;
      case 'too-many-requests':
        message = 'Muitas tentativas. Tente novamente mais tarde.';
        break;
      case 'network-request-failed':
        message = 'Erro de conexão. Verifique sua internet.';
        break;
      default:
        message = 'Erro ao autenticar: ${e.message}';
    }

    return AuthResult.error(message);
  }

  Future<AuthResult> validateToken() async {
    try {
      User? firebaseUser = _authService.currentUser;

      if (firebaseUser == null) {
        return AuthResult.error('Token inválido');
      }

      // Obter o token do Firebase
      String? token = await firebaseUser.getIdToken();

      // Buscar dados adicionais do Firestore
      UserModel? user = await _firestoreService.getUserData(firebaseUser.uid);

      if (user == null) {
        return AuthResult.error('Dados do usuário não encontrados');
      }

      // Atualizar email e token
      user = user.copyWith(
        email: firebaseUser.email,
        id: firebaseUser.uid,
        token: token,
      );

      return AuthResult.success(user);
    } catch (e) {
      return AuthResult.error('Erro ao validar token: $e');
    }
  }

  Future<AuthResult> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential =
          await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? firebaseUser = credential.user;

      if (firebaseUser == null) {
        return AuthResult.error('Erro ao fazer login');
      }

      // Obter o token do Firebase
      String? token = await firebaseUser.getIdToken();

      // Buscar dados adicionais do Firestore
      UserModel? user = await _firestoreService.getUserData(firebaseUser.uid);

      if (user == null) {
        return AuthResult.error('Dados do usuário não encontrados');
      }

      user = user.copyWith(
        email: firebaseUser.email,
        id: firebaseUser.uid,
        token: token,
      );

      return AuthResult.success(user);
    } on FirebaseAuthException catch (e) {
      return _handleFirebaseAuthError(e);
    } catch (e) {
      return AuthResult.error('Erro ao fazer login: $e');
    }
  }

  Future<AuthResult> signUp(UserModel user) async {
    try {
      // Criar usuário no Firebase Auth
      UserCredential credential =
          await _authService.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      User? firebaseUser = credential.user;

      if (firebaseUser == null) {
        return AuthResult.error('Erro ao criar conta');
      }

      // Obter o token do Firebase
      String? token = await firebaseUser.getIdToken();

      // Salvar dados adicionais no Firestore
      UserModel newUser = user.copyWith(
        id: firebaseUser.uid,
        email: firebaseUser.email,
        token: token,
      );

      await _firestoreService.saveUserData(newUser);

      return AuthResult.success(newUser);
    } on FirebaseAuthException catch (e) {
      return _handleFirebaseAuthError(e);
    } catch (e) {
      return AuthResult.error('Erro ao criar conta: $e');
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _authService.sendPasswordResetEmail(email);
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseAuthError(e).toString();
    } catch (e) {
      throw 'Erro ao enviar email de recuperação: $e';
    }
  }
}
