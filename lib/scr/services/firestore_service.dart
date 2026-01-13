import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greengrocer/scr/models/models.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const String usersCollection = 'users';

  Future<void> saveUserData(UserModel user) async {
    await _firestore.collection(usersCollection).doc(user.id).set({
      'fullname': user.name,
      'email': user.email,
      'phone': user.phone,
      'cpf': user.cpf,
    });
  }

  Future<UserModel?> getUserData(String userId) async {
    DocumentSnapshot doc =
        await _firestore.collection(usersCollection).doc(userId).get();

    if (!doc.exists) return null;

    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return UserModel(
      id: userId,
      name: data['fullname'],
      email: data['email'],
      phone: data['phone'],
      cpf: data['cpf'],
    );
  }

  Future<void> updateUserData(UserModel user) async {
    await _firestore.collection(usersCollection).doc(user.id).update({
      'fullname': user.name,
      'phone': user.phone,
      'cpf': user.cpf,
    });
  }

  Future<void> deleteUserData(String userId) async {
    await _firestore.collection(usersCollection).doc(userId).delete();
  }
}
