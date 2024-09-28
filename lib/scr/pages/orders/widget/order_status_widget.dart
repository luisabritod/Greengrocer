import 'package:flutter/material.dart';
import 'package:greengrocer/scr/pages/orders/widget/components/components.dart';

class OrderStatusWidget extends StatelessWidget {
  OrderStatusWidget({super.key, required this.status, required this.isOverdue});

  final String status;
  final bool isOverdue;

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StatusDot(
          isActive: true,
          title: 'Ordered',
        ),
        const CustomDivider(),
        if (currentStatus == 1) ...[
          const StatusDot(
            isActive: true,
            title: 'Refunded',
            backgroundColor: Colors.orange,
          ),
        ] else if (isOverdue) ...[
          const StatusDot(
            isActive: true,
            title: 'Payment expired',
            backgroundColor: Colors.red,
          ),
        ] else ...[
          StatusDot(
            isActive: currentStatus >= 2,
            title: 'Paid',
          ),
          const CustomDivider(),
          StatusDot(
            isActive: currentStatus >= 3,
            title: 'Preparing purchase',
          ),
          const CustomDivider(),
          StatusDot(
            isActive: currentStatus >= 4,
            title: 'Shipping',
          ),
          const CustomDivider(),
          StatusDot(
            isActive: currentStatus >= 5,
            title: 'Delivered',
          ),
        ]
      ],
    );
  }
}
