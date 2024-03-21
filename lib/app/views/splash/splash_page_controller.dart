import 'package:get/get.dart';
import 'package:vatansoft_case/app/routes/pageRoutes.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 2)).then((value) async => await Get.offAndToNamed(PageRoutes.home));
    super.onReady();
  }
}
