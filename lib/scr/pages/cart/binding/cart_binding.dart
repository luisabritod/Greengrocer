import 'package:get/get.dart';
import 'package:greengrocer/scr/pages/cart/cart.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
  }
}
