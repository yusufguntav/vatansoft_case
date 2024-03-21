// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vatansoft_case/core/variables/color_table.dart';
import 'package:vatansoft_case/core/variables/enums.dart';
import 'package:vatansoft_case/core/variables/standartMeasurementUnits.dart';

import 'bottom_nav_bar_controller.dart';

class BottomNavBar extends GetView<BottomNavBarController> {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _bottomNavBar(controller),
    );
  }
}

BottomNavigationBar _bottomNavBar(BottomNavBarController controller) => BottomNavigationBar(
      showSelectedLabels: false,
      onTap: (index) => controller.changePage(index),
      currentIndex: controller.getSelectedIndex,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      elevation: 10,
      items: _bottomNavItems(controller),
    );

List<BottomNavigationBarItem> _bottomNavItems(BottomNavBarController controller) => <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Images.ufoIcon.path,
            width: StandartMeasurementUnits.highIconSize,
            color: controller.getSelectedIndex == 0 ? ColorTable.primaryColor : null,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Images.settingIcon.path,
            width: StandartMeasurementUnits.highIconSize,
            color: controller.getSelectedIndex == 1 ? ColorTable.primaryColor : null,
          ),
          label: ''),
    ];
