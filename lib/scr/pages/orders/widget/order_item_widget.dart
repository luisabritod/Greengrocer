import 'package:flutter/material.dart';
import 'package:greengrocer/scr/models/models.dart';
import 'package:greengrocer/scr/services/services.dart';

class OrderItemWidget extends StatelessWidget {
  OrderItemWidget({
    super.key,
    required this.orderItem,
  });

  final UtilsServices utilsServices = UtilsServices();

  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Text(orderItem.item.itemName)),
          Text(
            utilsServices.priceToCurrency(orderItem.totalPrice()),
          ),
        ],
      ),
    );
  }
}
