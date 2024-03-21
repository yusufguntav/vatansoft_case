import 'package:get/get.dart';
import 'package:vatansoft_case/app/views/splash/splash_page_controller.dart';

class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
  }
}
