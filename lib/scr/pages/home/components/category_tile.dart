import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile(
      {super.key,
      required this.category,
      required this.isSelected,
      required this.onPressed});

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff194a01) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.transparent : const Color(0xff194a01),
          ),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xff194a01),
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
