// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vatansoft_case/core/services/storage/boxes.dart';
import 'package:vatansoft_case/core/services/storage/preferences.dart';
import 'package:vatansoft_case/core/theme/theme_service.dart';
import 'package:vatansoft_case/core/variables/enums.dart';

import '../storage/storage_key_enums.dart';

Map<String, Locale> locales = {
  LanguageType.english.name: const Locale('en', 'US'),
  LanguageType.turkish.name: const Locale('tr', 'TR'),
};

class LanguageService extends GetxService {
  // Eğer cihazın dili desteklemediğimiz bir dilse belirttiğimiz dil döner
  static const Locale fallbackLocale = Locale('tr', 'TR');
  Locale currentLocale = const Locale('tr', 'TR');
  @override
  void onInit() {
    Preferences? preferences = boxPreferences.get(StorageKeys.preferences.name);
    if (preferences?.language is String) {
      currentLocale =
          Locale.fromSubtags(languageCode: locales[preferences?.language]?.languageCode ?? fallbackLocale.languageCode);
    } else {
      currentLocale = Get.deviceLocale ?? fallbackLocale;
    }

    print('Current Locale: $currentLocale');
    super.onInit();
  }

  String get getCurrentLangaugeName {
    if (currentLocale == locales[LanguageType.english.name]) return LanguageType.english.name;
    return LanguageType.turkish.name;
  }

  Future<void> setLocale(String languageType) async {
    await boxPreferences.put(
        StorageKeys.preferences.name, Preferences(language: languageType, theme: ThemeService.loadThemeFromStorage().name));
    await Get.updateLocale(locales[languageType] ?? fallbackLocale);
  }
}
