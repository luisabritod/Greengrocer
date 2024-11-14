import 'package:get/get.dart';
import 'package:greengrocer/scr/pages/home/home.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
