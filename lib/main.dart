import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/scr/pages/auth/controller/controller.dart';
import 'package:greengrocer/scr/pages_routes/pages_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GreenGrocer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF49b869)),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      getPages: AppPages.pages,
      initialRoute: PagesRoutes.splash,
    );
  }
}
