import 'package:get/get.dart';
import 'package:greengrocer/scr/pages/base/base.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
  }
}
