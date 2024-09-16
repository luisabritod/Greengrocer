import 'package:flutter/material.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({super.key});

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

int quantity = 1;

class _QuantityWidgetState extends State<QuantityWidget> {
  Icon icon = const Icon(Icons.remove);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (quantity <= 1) {
                  icon = const Icon(Icons.delete);
                } else {
                  quantity--;
                  icon = const Icon(Icons.remove);
                }
              });
            },
            icon: icon,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              quantity.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                quantity++;
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
