import 'package:get/get.dart';
import 'package:greengrocer/scr/pages/auth/auth.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    await authRepository.signIn(email: email, password: password);
    // await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    // try {
    //   isLoading(true);
    //   // await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    // } catch (e) {
    //   Get.snackbar('Error', e.toString());
    // } finally {
    //   isLoading(false);
    // }
  }
}
