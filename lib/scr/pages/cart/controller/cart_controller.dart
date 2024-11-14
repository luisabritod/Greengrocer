import 'package:get/get.dart';
import 'package:greengrocer/scr/pages/auth/auth.dart';
import 'package:greengrocer/scr/pages/cart/cart.dart';

class CartController extends GetxController {
  final cartRepository = CartRepository();
  final authController = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();

    getCartItems();
  }

  Future<void> getCartItems() async {
    await cartRepository.getCartItems(
      token: authController.user.token!,
      userId: authController.user.id!,
    );
  }
}
