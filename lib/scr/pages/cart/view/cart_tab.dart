import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/scr/config/config.dart';
import 'package:greengrocer/scr/pages/cart/cart.dart';
import 'package:greengrocer/scr/services/services.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartController>(
              builder: (controller) {
                if (controller.cartItems.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove_shopping_cart,
                        size: 40,
                        color: CustomColors.primaryGreen,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Your cart is empty',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                }

                return ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTile(
                      cartItem: controller.cartItems[index],
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: GetBuilder<CartController>(
                    builder: (controller) {
                      return Text(
                        utilsServices
                            .priceToCurrency(controller.cartTotalPrice()),
                        style: TextStyle(
                          fontSize: 23,
                          color: CustomColors.primaryGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool? result = await showOrderConfirmation();

                      if (result ?? false) {
                        cartController.checkoutCart();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.primaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      'Check Out',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Text('Order Confirmation'),
            content: const Text('Do you want to confirm this order?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('No'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: CustomColors.primaryGreen,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Yes'),
              ),
            ],
          );
        });
  }
}
