import 'package:greengrocer/scr/constants/constants.dart';
import 'package:greengrocer/scr/models/models.dart';
import 'package:greengrocer/scr/pages/auth/auth.dart';
import 'package:greengrocer/scr/services/services.dart';

class AuthRepository {
  final HttpManager httpManager = HttpManager();

  Future<AuthResult> validateToken(String token) async {
    final result = await httpManager.restRequest(
      url: Endpoints.validateToken,
      method: HttpMethods.post,
      headers: {
        'X-Parse-Session-Token': token,
      },
    );

    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(
        authErrorsString(result['error']),
      );
    }
  }

  Future<AuthResult> signIn(
      {required String email, required String password}) async {
    final result = await httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(
        authErrorsString(result['error']),
      );
    }
  }
}
