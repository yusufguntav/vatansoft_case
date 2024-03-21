import 'package:get/get.dart';
import 'package:vatansoft_case/app/views/list_page/list_page_service.dart';

import 'list_page_controller.dart';

class ListPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListPageService());
    Get.lazyPut(() => ListPageController());
  }
}
