import 'package:flutter/material.dart';
import 'package:greengrocer/scr/config/config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CustomColors.primaryGreenDark.withOpacity(0.9),
              CustomColors.primaryGreen.withOpacity(0.6),
              CustomColors.primaryGreenLight.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextSpanAppName(color: Colors.white, fontSize: 40),
            SizedBox(
              height: 10,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
