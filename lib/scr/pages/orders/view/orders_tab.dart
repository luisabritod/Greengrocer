import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/scr/pages/pages.dart';

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
      body: GetBuilder<OrdersController>(
        builder: (controller) {
          return RefreshIndicator(
            onRefresh: () => controller.getAllOrders(),
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                return OrdersTile(
                  order: controller.allOrders[index],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: controller.allOrders.length,
            ),
          );
        },
      ),
    );
  }
}
