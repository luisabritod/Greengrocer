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
    return cartItems.indexWhere((itemInList) => itemInList.id == item.id);
  }

  Future<void> addItemCart({required ItemModels item, int quantity = 1}) async {
    int itemIndex = getItemIndex(item);

    if (itemIndex >= 0) {
      //already in cart
      cartItems[itemIndex].quantity += quantity;
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

      //add to cart
      cartItems.add(
        CartItemModel(
          id: '',
          item: item,
          quantity: quantity,
        ),
      );
    }

    update();
  }
}
