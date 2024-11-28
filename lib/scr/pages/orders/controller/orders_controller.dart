import 'package:get/get.dart';
import 'package:greengrocer/scr/models/models.dart';
import 'package:greengrocer/scr/pages/auth/controller/controller.dart';
import 'package:greengrocer/scr/pages/orders/orders.dart';
import 'package:greengrocer/scr/services/services.dart';

class OrdersController extends GetxController {
  List<OrdersModel> allOrders = [];
  final authController = Get.find<AuthController>();
  final ordersRepository = OrdersRepository();
  final utilsServices = UtilsServices();

  @override
  void onInit() {
    super.onInit();
    getAllOrders();
  }

  Future<void> getAllOrders() async {
    OrdersResult<List<OrdersModel>> result =
        await ordersRepository.getAllOrders(
      userId: authController.user.id!,
      token: authController.user.token!,
    );

    result.when(success: (orders) {
      allOrders = orders;
      update();
    }, error: (message) {
      utilsServices.showToast(message: message, isError: true);
    });
  }
}
