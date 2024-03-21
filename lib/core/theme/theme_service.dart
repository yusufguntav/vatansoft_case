// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:vatansoft_case/core/services/storage/boxes.dart';
import 'package:vatansoft_case/core/services/storage/preferences.dart';
import 'package:vatansoft_case/core/services/storage/storage_key_enums.dart';
import 'package:vatansoft_case/core/variables/enums.dart';

import '../services/language/language_service.dart';

Rx<ThemeType> selectedTheme = ThemeType.light.obs;

class ThemeService extends GetxService {
  static ThemeType loadThemeFromStorage() {
    Preferences? pref = boxPreferences.get(StorageKeys.preferences.name);
    if (pref?.theme == null) {
      bool isLight = SchedulerBinding.instance.window.platformBrightness == Brightness.light;
      return isLight ? ThemeType.light : ThemeType.dark;
    }
    if (pref!.theme == ThemeType.light.name) return ThemeType.light;
    return ThemeType.dark;
  }

  @override
  void onInit() {
    getThemeData();
    super.onInit();
  }

  getThemeData() {
    ThemeType themeType = loadThemeFromStorage();
    if (themeType == ThemeType.light) {
      Get.changeThemeMode(ThemeMode.light);
      selectedTheme.value = ThemeType.light;
      return;
    }
    Get.changeThemeMode(ThemeMode.dark);
    selectedTheme.value = ThemeType.dark;
  }

  void switchTheme() {
    final languageService = Get.find<LanguageService>();
    if (loadThemeFromStorage() == ThemeType.light) {
      Get.changeThemeMode(ThemeMode.dark);
      selectedTheme.value = ThemeType.dark;
      boxPreferences.put(StorageKeys.preferences.name,
          Preferences(theme: ThemeType.dark.name, language: languageService.getCurrentLangaugeName));
    } else {
      Get.changeThemeMode(ThemeMode.light);
      selectedTheme.value = ThemeType.light;
      boxPreferences.put(StorageKeys.preferences.name,
          Preferences(theme: ThemeType.light.name, language: languageService.getCurrentLangaugeName));
    }
  }
}
