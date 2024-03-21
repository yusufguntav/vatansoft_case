import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vatansoft_case/app/common/widgets/custom_text.dart';
import 'package:vatansoft_case/core/variables/enums.dart';

import '../../../core/theme/theme_service.dart';
import '../../../core/variables/standart_measurement_units.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {super.key,
      this.appbarTitle,
      this.customAppBar,
      required this.content,
      this.showAppBar = false,
      this.scrollController,
      this.showThemeButton = true});
  final List<Widget> content;
  final String? appbarTitle;
  final bool showThemeButton;
  final bool showAppBar;
  final ScrollController? scrollController;
  final AppBar? customAppBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? customAppBar ??
              AppBar(actions: [
                IconButton(
                    onPressed: () {
                      final themeService = Get.find<ThemeService>();
                      themeService.switchTheme();
                    },
                    icon: Obx(() =>
                        selectedTheme.value == ThemeType.light ? const Icon(Icons.wb_sunny) : const Icon(Icons.nightlight_round)))
              ], centerTitle: true, title: CustomText.extraHigh(appbarTitle ?? "", textColor: Colors.white))
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: EdgeInsets.all(StandartMeasurementUnits.normalPadding),
            child: Center(child: Column(children: content)),
          ),
        ),
      ),
    );
  }
}
