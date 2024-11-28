import 'package:get/get.dart';
import 'package:greengrocer/scr/pages/orders/orders.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrdersController());
  }
}
