import 'package:get/get.dart';
import 'package:greengrocer/scr/constants/constants.dart';
import 'package:greengrocer/scr/models/models.dart';
import 'package:greengrocer/scr/pages/auth/auth.dart';
import 'package:greengrocer/scr/pages_routes/pages_routes.dart';
import 'package:greengrocer/scr/services/services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final utilsServices = UtilsServices();
  UserModel user = UserModel();

  Future<void> validateToken(String token) async {
    String? token = await utilsServices.getLocalData(key: StorageKeys.token);

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signIn);
      return;
    }

    AuthResult result = await authRepository.validateToken(token);

    result.when(
      success: (user) {
        this.user = user;

        saveTokenAndProceedToBase();
      },
      error: (message) {
        signOut();
      },
    );
  }

  Future<void> signOut() async {
    user = UserModel();

    await utilsServices.removeLocalData(key: StorageKeys.token);

    Get.offAllNamed(PagesRoutes.signIn);
  }

  void saveTokenAndProceedToBase() async {
    await utilsServices.saveLocalData(
      key: StorageKeys.token,
      data: user.token!,
    );

    Get.offAllNamed(PagesRoutes.base);
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result =
        await authRepository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;

        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilsServices.showToast(message: message, isError: true);
      },
    );
  }
}
