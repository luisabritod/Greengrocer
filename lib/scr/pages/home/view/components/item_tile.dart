import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/scr/config/config.dart';
import 'package:greengrocer/scr/models/models.dart';
import 'package:greengrocer/scr/pages/cart/cart.dart';
import 'package:greengrocer/scr/pages_routes/pages_routes.dart';
import 'package:greengrocer/scr/services/services.dart';

class ItemTile extends StatefulWidget {
  const ItemTile(
      {super.key, required this.item, required this.cartAnimationMethod});

  final ItemModels item;
  final void Function(GlobalKey) cartAnimationMethod;

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  final GlobalKey imageGk = GlobalKey();
  final UtilsServices utilsServices = UtilsServices();
  final cartController = Get.find<CartController>();

  IconData tileIcon = Icons.add_shopping_cart_outlined;

  Future<void> switchIcon() async {
    setState(() => tileIcon = Icons.check);
    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() => tileIcon = Icons.add_shopping_cart_outlined);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(PagesRoutes.productRoute, arguments: widget.item);
          },
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadowColor: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //image
                  Expanded(
                    child: Image.network(
                      widget.item.imgUrl,
                      key: imageGk,
                    ),
                  ),
                  //name
                  Text(widget.item.itemName),
                  //price
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(widget.item.price),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.primaryGreen,
                        ),
                      ),
                      Text(
                        ' / ${widget.item.unit}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {
              switchIcon();

              cartController.addItemToCart(item: widget.item);

              widget.cartAnimationMethod(imageGk);
            },
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                color: CustomColors.primaryGreen,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Icon(
                tileIcon,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
