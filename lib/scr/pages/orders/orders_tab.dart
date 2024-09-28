import 'package:flutter/material.dart';
import 'package:greengrocer/scr/config/config.dart';
import 'package:greengrocer/scr/pages/orders/components/components.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return OrdersTile(
            order: orders[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: orders.length,
      ),
    );
  }
}
