import 'package:get/get.dart';
import 'package:greengrocer/scr/pages/pages.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: PagesRoutes.signIn,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: PagesRoutes.signUp,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: PagesRoutes.base,
      page: () => const BaseScreen(),
    ),
  ];
}

abstract class PagesRoutes {
  static const String splash = '/splash';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String base = '/base';
}
