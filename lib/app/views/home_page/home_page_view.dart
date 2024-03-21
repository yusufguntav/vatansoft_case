import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vatansoft_case/app/common/widgets/content_card.dart';
import 'package:vatansoft_case/app/common/widgets/custom_scaffold.dart';
import 'package:vatansoft_case/app/routes/pageRoutes.dart';
import 'package:vatansoft_case/app/views/home_page/home_page_controller.dart';
import 'package:vatansoft_case/core/variables/enums.dart';
import 'package:vatansoft_case/core/variables/standartMeasurementUnits.dart';
import 'package:vatansoft_case/generated/locales.g.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(showAppBar: true, appbarTitle: 'RICK and MORTY', content: [
      ContentCard(
        imagePathFromAsset: Images.characters.path,
        title: LocaleKeys.characters.tr,
        onTap: () => Get.toNamed(PageRoutes.list),
        width: Get.width * .8,
        imageHeight: Get.height * .3,
      ),
      SizedBox(height: StandartMeasurementUnits.normalPadding),
      ContentCard(
        imagePathFromAsset: Images.episodes.path,
        title: LocaleKeys.episodes.tr,
        width: Get.width * .8,
        imageHeight: Get.height * .3,
      ),
      SizedBox(height: StandartMeasurementUnits.normalPadding),
      ContentCard(
        imagePathFromAsset: Images.locations.path,
        title: LocaleKeys.locations.tr,
        width: Get.width * .8,
        imageHeight: Get.height * .3,
      ),
      SizedBox(height: StandartMeasurementUnits.normalPadding)
    ]);
  }
}
