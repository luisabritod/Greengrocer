import 'package:flutter/material.dart';

class TextSpanAppName extends StatelessWidget {
  const TextSpanAppName({
    super.key,
    required this.color,
    required this.fontSize,
  });

  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: fontSize,
        ),
        children: [
          TextSpan(
            text: 'Green',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const TextSpan(
              text: 'grocer',
              style: TextStyle(
                color: Color(0xff194a01),
              )),
        ],
      ),
    );
  }
}
