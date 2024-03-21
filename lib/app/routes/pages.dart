import 'package:get/get.dart';
import 'package:vatansoft_case/app/routes/pageRoutes.dart';
import 'package:vatansoft_case/app/views/list_page/list_page_binding.dart';
import 'package:vatansoft_case/app/views/list_page/list_page_view.dart';
import 'package:vatansoft_case/app/views/home_page/home_page_binding.dart';
import 'package:vatansoft_case/app/views/home_page/home_page_view.dart';
import 'package:vatansoft_case/app/views/settings_page/settings_binding.dart';
import 'package:vatansoft_case/app/views/settings_page/settings_view.dart';
import 'package:vatansoft_case/app/views/splash/splash_page_binding.dart';
import 'package:vatansoft_case/app/views/splash/splash_page_view.dart';

class Pages {
  static final pages = [
    GetPage(
      binding: HomePageBinding(),
      name: PageRoutes.home,
      page: () => const HomePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      binding: SplashScreenBinding(),
      name: PageRoutes.splash,
      page: () => const SplashPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      binding: SettingsBinding(),
      name: PageRoutes.settings,
      page: () => const SettingsPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      binding: ListPageBinding(),
      name: PageRoutes.list,
      page: () => const ListPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
