import 'package:get/get.dart';
import 'package:greengrocer/scr/pages/auth/controller/controller.dart';
import 'package:greengrocer/scr/pages/orders/orders.dart';

class OrderItemsController extends GetxController {
  final ordersRepository = OrdersRepository();
  final authController = Get.find<AuthController>();

  Future<void> getOrderItems() async {
    ordersRepository.getOrderItems(
      orderId: 'orderId',
      token: authController.user.token!,
    );
  }
}
