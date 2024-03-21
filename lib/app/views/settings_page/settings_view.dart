import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vatansoft_case/app/common/widgets/custom_button.dart';
import 'package:vatansoft_case/app/common/widgets/custom_dialog.dart';
import 'package:vatansoft_case/app/common/widgets/custom_scaffold.dart';
import 'package:vatansoft_case/core/services/language/language_service.dart';
import 'package:vatansoft_case/core/variables/enums.dart';
import 'package:vatansoft_case/core/variables/standart_measurement_units.dart';
import 'package:vatansoft_case/generated/locales.g.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageService = Get.find<LanguageService>();
    return CustomScaffold(
      appbarTitle: LocaleKeys.settings.tr,
      showAppBar: true,
      content: [
        CustomButton(
          onPress: () => Get.dialog(_changeLanguage(languageService)),
          buttonText: LocaleKeys.change_language.tr,
        )
      ],
    );
  }

  CustomDialog _changeLanguage(LanguageService languageService) {
    return CustomDialog(
      showCloseButton: true,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(
            buttonText: "Türkçe",
            onPress: () {
              languageService.setLocale(LanguageType.turkish.name);
              Get.back();
            },
          ),
          SizedBox(height: StandartMeasurementUnits.normalPadding),
          CustomButton(
              buttonText: "English",
              onPress: () {
                languageService.setLocale(LanguageType.english.name);
                Get.back();
              })
        ],
      ),
    );
  }
}
