import 'package:flutter/material.dart';
import 'package:greengrocer/scr/config/config.dart';

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
          TextSpan(
              text: 'grocer',
              style: TextStyle(
                color: CustomColors.primaryGreen,
              )),
        ],
      ),
    );
  }
}
