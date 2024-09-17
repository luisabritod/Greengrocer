import 'package:flutter/material.dart';
import 'package:greengrocer/scr/config/config.dart';
import 'package:greengrocer/scr/widgets/widgets.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget(
      {super.key,
      required this.value,
      required this.suffixText,
      required this.result});

  final int value;
  final String suffixText;
  final Function(int quantity) result;

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
          QuantityButton(
            color: Colors.grey.shade200,
            icon: Icons.remove,
            onPressed: () {
              if (value == 1) return;
              int resultCount = value - 1;
              result(resultCount);
            },
            iconColor: CustomColors.primaryGreen,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '$value$suffixText',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          QuantityButton(
            color: CustomColors.primaryGreen,
            icon: Icons.add,
            onPressed: () {
              int resultCount = value + 1;
              result(resultCount);
            },
            iconColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
