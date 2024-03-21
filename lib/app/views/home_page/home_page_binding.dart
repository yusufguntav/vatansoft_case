import 'package:get/get.dart';
import 'package:vatansoft_case/app/views/home_page/home_page_controller.dart';
import 'package:vatansoft_case/app/views/home_page/home_page_service.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageService());
    Get.lazyPut(() => HomePageController());
  }
}
