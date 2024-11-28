import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/scr/config/config.dart';
import 'package:greengrocer/scr/models/models.dart';
import 'package:greengrocer/scr/pages/orders/controller/controller.dart';
import 'package:greengrocer/scr/pages/orders/view/widget/widget.dart';
import 'package:greengrocer/scr/services/services.dart';
import 'package:greengrocer/scr/widgets/widgets.dart';

class OrdersTile extends StatelessWidget {
  OrdersTile({super.key, required this.order});

  final OrdersModel order;

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: GetBuilder<OrderItemsController>(
          init: OrderItemsController(order),
          global: false,
          builder: (controller) {
            return ExpansionTile(
              // initiallyExpanded: order.status == 'pending_payment',
              onExpansionChanged: (value) {
                if (value && order.items.isEmpty) {
                  controller.getOrderItems();
                }
              },
              title: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order: #${order.id}'),
                  Text(
                    utilsServices.formatDateTime(order.createdDateTime!),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
              childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: 150,
                          child: ListView(
                            children: order.items.map((orderItem) {
                              return OrderItemWidget(orderItem: orderItem);
                            }).toList(),
                          ),
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.grey,
                        thickness: 2,
                        width: 8,
                      ),
                      Expanded(
                        flex: 2,
                        child: OrderStatusWidget(
                          status: order.status,
                          isOverdue:
                              order.overdueDateTime.isBefore(DateTime.now()),
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Total: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: utilsServices.priceToCurrency(order.total),
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: order.status == 'pending_payment',
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        foregroundColor: CustomColors.primaryGreen,
                        side: BorderSide(
                          color: CustomColors.primaryGreen,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return PaymentDialog(
                                order: order,
                              );
                            });
                      },
                      label: const Text('QR Code Pix'),
                      icon: const Icon(Icons.pix_outlined),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
