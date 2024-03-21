import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vatansoft_case/app/common/widgets/bottom_nav_bar/widget/portal_button.dart';
import 'package:vatansoft_case/core/services/language/language_service.dart';
import 'package:vatansoft_case/core/services/network/base_network_service.dart';
import 'package:vatansoft_case/core/services/storage/boxes.dart';
import 'package:vatansoft_case/core/services/storage/preferences.dart';
import 'package:vatansoft_case/core/theme/appTheme.dart';
import 'package:vatansoft_case/generated/locales.g.dart';

import 'app/common/widgets/bottom_nav_bar/bottom_nav_bar_controller.dart';
import 'app/common/widgets/bottom_nav_bar/bottom_nav_bar_view.dart';
import 'app/routes/pageRoutes.dart';
import 'app/routes/pages.dart';
import 'app/views/splash/splash_page_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PreferencesAdapter());
  boxPreferences = await Hive.openBox<Preferences>('preferences');
  await initApp();
}

Future<void> initApp() async {
  Get.put(BaseNetworkService());
  Get.put(LanguageService());
  Get.put(BottomNavBarController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageService = Get.find<LanguageService>();
    final controller = Get.find<BottomNavBarController>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Pages.pages,
      initialRoute: PageRoutes.splash,
      initialBinding: SplashScreenBinding(),
      theme: AppTheme.light,
      title: 'Vatansoft Case',
      routingCallback: (value) {
        if (value?.current == PageRoutes.splash) return;
        controller.checkPage(value?.current ?? '/');
      },
      translationsKeys: AppTranslation.translations,
      locale: languageService.currentLocale,
      fallbackLocale: LanguageService.fallbackLocale,
      supportedLocales: locales.values,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) => Scaffold(
                body: child,
                floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                floatingActionButton: Obx(() =>
                    controller.getShowBottomNavBarValue && MediaQuery.viewInsetsOf(context).bottom == 0
                        ? const PortalButton()
                        : const SizedBox()),
                bottomNavigationBar: Obx(() => controller.getShowBottomNavBarValue ? const BottomNavBar() : const SizedBox()),
              ),
            )
          ],
        );
      },
    );
  }
}
