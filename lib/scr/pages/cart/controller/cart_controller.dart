import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/scr/models/models.dart';
import 'package:greengrocer/scr/pages/auth/auth.dart';
import 'package:greengrocer/scr/pages/cart/cart.dart';
import 'package:greengrocer/scr/services/services.dart';
import 'package:greengrocer/scr/widgets/payment_dialog.dart';

class CartController extends GetxController {
  final cartRepository = CartRepository();
  final authController = Get.find<AuthController>();
  final utilsServices = UtilsServices();

  List<CartItemModel> cartItems = [];

  bool isCheckoutLoading = false;

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

  void setCheckoutLoading(bool value) {
    isCheckoutLoading = value;
    update();
  }

  Future checkoutCart() async {
    setCheckoutLoading(true);

    CartResult<OrdersModel> result = await cartRepository.checkouCart(
      token: authController.user.token!,
      total: cartTotalPrice(),
    );

    setCheckoutLoading(false);

    result.when(sucess: (order) {
      cartItems.clear();
      update();

      showDialog(
        context: Get.context!,
        builder: (_) {
          return PaymentDialog(order: order);
        },
      );
    }, error: (message) {
      utilsServices.showToast(
        message: message,
      );
    });
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

    if (result) {
      if (quantity == 0) {
        cartItems.removeWhere((cartItems) => cartItems.id == item.id);
      } else {
        cartItems.firstWhere((cartItems) => cartItems.id == item.id).quantity =
            quantity;
      }

      update();
    } else {
      utilsServices.showToast(
        message: 'Error changing quantity',
        isError: true,
      );
    }

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

  Future<void> addItemToCart({
    required ItemModels item,
    int quantity = 1,
  }) async {
    int itemIndex = getItemIndex(item);

    if (itemIndex >= 0) {
      final product = cartItems[itemIndex];

      await changeItemQuantity(
        item: product,
        quantity: (quantity + product.quantity),
      );
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
