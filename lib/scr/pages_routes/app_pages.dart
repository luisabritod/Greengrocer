import 'package:flutter/material.dart';
import 'package:greengrocer/scr/pages/pages.dart';

class AppRoutes {
  static const String splash = '/';
  static const String base = '/home';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
}

class AppPages {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.splash: (context) => const SplashScreen(),
    AppRoutes.base: (context) => const BaseScreen(),
    AppRoutes.signIn: (context) => const SignInScreen(),
    AppRoutes.signUp: (context) => const SignUpScreen(),
  };
}
