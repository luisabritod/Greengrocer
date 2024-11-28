// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:greengrocer/scr/models/models.dart';
import 'package:greengrocer/scr/pages/auth/controller/controller.dart';
import 'package:greengrocer/scr/pages/orders/orders.dart';
import 'package:greengrocer/scr/services/services.dart';

class OrderItemsController extends GetxController {
  OrdersModel order;
  OrderItemsController(
    this.order,
  );

  final ordersRepository = OrdersRepository();
  final authController = Get.find<AuthController>();
  final utilsServices = UtilsServices();

  Future<void> getOrderItems() async {
    final OrdersResult<List<CartItemModel>> result =
        await ordersRepository.getOrderItems(
      orderId: order.id,
      token: authController.user.token!,
    );

    result.when(success: (items) {
      order.items = items;
      update();
    }, error: (message) {
      utilsServices.showToast(message: message, isError: true);
    });
  }
}
