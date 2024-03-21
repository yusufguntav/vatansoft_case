// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:vatansoft_case/app/routes/pageRoutes.dart';

class BottomNavBarController extends GetxController {
  final Rx<bool> _showBottomNavBar = false.obs;
  bool get getShowBottomNavBarValue => _showBottomNavBar.value;
  set setShowBottomNavBarValue(bool val) => _showBottomNavBar.value = val;

  final Rx<int> _selectedIndex = 0.obs;
  int get getSelectedIndex => _selectedIndex.value;
  set setSelectedIndex(int val) => _selectedIndex.value = val;

  final List<String> _mainPageRoutes = [PageRoutes.home, PageRoutes.settings];

  changePage(index) {
    //TODO isoverlayopen
    if (Get.isOverlaysOpen) return;
    if (Get.currentRoute == _mainPageRoutes[index]) return;
    Get.offAllNamed(_mainPageRoutes[index]);
    setSelectedIndex = index;
  }

  //Sayfaya göre BottomNavBar göster/gösterme işlemi
  checkPage(String? page) {
    switch (page) {
      case PageRoutes.splash:
        setShowBottomNavBarValue = false;
        break;
      case '/':
        setShowBottomNavBarValue = false;
        break;
      default:
        setShowBottomNavBarValue = true;
    }
  }
}
