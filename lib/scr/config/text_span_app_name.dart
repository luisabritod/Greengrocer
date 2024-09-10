import 'package:flutter/material.dart';

class TextSpanAppName extends StatelessWidget {
  const TextSpanAppName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: 40,
        ),
        children: [
          TextSpan(
            text: 'Green',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          TextSpan(
              text: 'grocer',
              style: TextStyle(
                color: Color(0xff194a01),
              )),
        ],
      ),
    );
  }
}
