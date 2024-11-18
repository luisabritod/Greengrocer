import 'package:get/get.dart';
import 'package:greengrocer/scr/models/models.dart';
import 'package:greengrocer/scr/pages/auth/auth.dart';
import 'package:greengrocer/scr/pages/cart/cart.dart';
import 'package:greengrocer/scr/services/services.dart';

class CartController extends GetxController {
  final cartRepository = CartRepository();
  final authController = Get.find<AuthController>();
  final utilsServices = UtilsServices();

  List<CartItemModel> cartItems = [];

  @override
  void onInit() {
    super.onInit();

    getCartItems();
  }

  double cartTotalPrice() {
    double total = 0;

    for (final item in cartItems) {
      total += item.totalPrice();
    }

    return total;
  }

  Future<bool> changeItemQuantity({
    required CartItemModel item,
    required int quantity,
  }) async {
    final result = await cartRepository.changeItemQuantity(
      token: authController.user.token!,
      cartItemId: item.id,
      quantity: quantity,
    );

    return result;
  }

  Future<void> getCartItems() async {
    final CartResult<List<CartItemModel>> result =
        await cartRepository.getCartItems(
      token: authController.user.token!,
      userId: authController.user.id!,
    );

    result.when(sucess: (data) {
      cartItems = data;
      update();
      print(' Cart: $data');
    }, error: (message) {
      utilsServices.showToast(
        message: message,
        isError: true,
      );
    });
  }

  int getItemIndex(ItemModels item) {
    return cartItems.indexWhere((itemInList) => itemInList.item.id == item.id);
  }

  Future<void> addItemCart({
    required ItemModels item,
    int quantity = 1,
  }) async {
    int itemIndex = getItemIndex(item);

    if (itemIndex >= 0) {
      final product = cartItems[itemIndex];

      final result = await changeItemQuantity(
        item: product,
        quantity: (quantity + product.quantity),
      );

      if (result) {
        cartItems[itemIndex].quantity += quantity;
      } else {
        utilsServices.showToast(
          message: 'Error',
          isError: true,
        );
      }
    } else {
      final CartResult<String> result = await cartRepository.addItemToCart(
        token: authController.user.token!,
        userId: authController.user.id!,
        productId: item.id,
        quantity: quantity,
      );

      result.when(sucess: (data) {
        cartItems.add(
          CartItemModel(
            id: data,
            item: item,
            quantity: quantity,
          ),
        );
      }, error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      });
    }

    update();
  }
}
