import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/scr/config/config.dart';
import 'package:greengrocer/scr/pages/base/base.dart';
import 'package:greengrocer/scr/pages/cart/cart.dart';
import 'package:greengrocer/scr/services/services.dart';
import 'package:greengrocer/scr/models/models.dart';
import 'package:greengrocer/scr/widgets/widgets.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key});

  final ItemModels item = Get.arguments;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  UtilsServices utilsServices = UtilsServices();

  int cartItemQuantity = 1;

  final navigationController = Get.find<NavigationController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Hero(
                    tag: widget.item.imgUrl,
                    child: Image.network(widget.item.imgUrl)),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[600] ?? Colors.transparent,
                          offset: const Offset(0, 2)),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.item.itemName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Flexible(
                              child: QuantityWidget(
                                value: cartItemQuantity,
                                suffixText: widget.item.unit,
                                result: (quantity) {
                                  setState(() {
                                    cartItemQuantity = quantity;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Text(
                          utilsServices.priceToCurrency(widget.item.price),
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.primaryGreenLight,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              widget.item.description,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                height: 1.5,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 55,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.primaryGreenLight,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              Get.back();

                              cartController.addItemCart(
                                  item: widget.item,
                                  quantity: cartItemQuantity);

                              navigationController
                                  .navigatePageView(NavigationTabs.cart);
                            },
                            label: const Text(
                              'Add to Cart',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            icon: const Icon(Icons.shopping_cart),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
