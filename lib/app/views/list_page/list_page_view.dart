import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vatansoft_case/app/common/widgets/content_card.dart';
import 'package:vatansoft_case/app/common/widgets/circle_animation.dart';
import 'package:vatansoft_case/app/common/widgets/custom_button.dart';
import 'package:vatansoft_case/app/common/widgets/custom_scaffold.dart';
import 'package:vatansoft_case/app/common/widgets/custom_text.dart';
import 'package:vatansoft_case/app/common/widgets/custom_dialog.dart';
import 'package:vatansoft_case/app/common/widgets/custom_text_field.dart';
import 'package:vatansoft_case/app/views/list_page/list_page_controller.dart';
import 'package:vatansoft_case/core/variables/color_table.dart';
import 'package:vatansoft_case/core/variables/enums.dart';
import 'package:vatansoft_case/core/variables/standart_measurement_units.dart';
import 'package:vatansoft_case/generated/locales.g.dart';

class ListPage extends GetView<ListPageController> {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppBar: true,
      scrollController: controller.scrollController,
      customAppBar: AppBar(
        automaticallyImplyLeading: true,
        title: CustomText.high(LocaleKeys.characters.tr, textColor: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_rounded),
            onPressed: () => Get.dialog(_filterDialog()),
          ),
        ],
      ),
      content: [
        _searchBar(),
        SizedBox(height: StandartMeasurementUnits.normalPadding),
        _listOfCharacters(),
      ],
    );
  }

  Obx _listOfCharacters() {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: StandartMeasurementUnits.normalPadding),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: StandartMeasurementUnits.normalPadding),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.characters.length + 1,
          itemBuilder: (content, index) {
            if (index < controller.characters.length) {
              return ContentCard(
                  title: controller.characters[index].name, imagePathFromNetwork: controller.characters[index].image);
            } else {
              return Obx(() => !controller.hasMoreData
                  ? const SizedBox()
                  : SizedBox(height: Get.height * .15, child: CircleAnimation(imagePath: Images.portalRNM.path)));
            }
          },
        ),
      ),
    );
  }

  SizedBox _searchBar() {
    return SizedBox(
      width: Get.width * .8,
      child: CustomTextField(
        color: ColorTable.primaryColor,
        prefixIcon: Icon(Icons.search, color: ColorTable.primaryColor),
        controller: controller.controllerList[FilterFields.name],
        onchange: (p0) async {
          if (p0.length == 1) controller.resetPageNumber();
          controller.hasMoreData = true;
          await controller.getCharacters();
          controller.characters.clear();
          if (p0 == "") controller.resetPageNumber();
        },
      ),
    );
  }

  CustomDialog _filterDialog() {
    return CustomDialog(
      showCloseButton: true,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _species(),
          SizedBox(height: StandartMeasurementUnits.normalPadding),
          _type(),
          SizedBox(height: StandartMeasurementUnits.normalPadding),
          _status(),
          SizedBox(height: StandartMeasurementUnits.normalPadding),
          _gender(),
          SizedBox(height: StandartMeasurementUnits.normalPadding),
          CustomButton(
            width: Get.width * .5,
            height: Get.height * .05,
            buttonText: LocaleKeys.apply.tr,
            onPress: () async {
              controller.hasMoreData = true;
              controller.resetPageNumber();
              controller.characters.clear();
              await controller.getCharacters();
              Get.back();
            },
          )
        ],
      ),
    );
  }

  DecoratedBox _gender() {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: ColorTable.primaryColor),
      ),
      child: DropdownMenu(
          controller: controller.controllerList[FilterFields.genders],
          label: CustomText(LocaleKeys.gender.tr),
          dropdownMenuEntries: [
            DropdownMenuEntry(
              label: Genders.female.text,
              value: Genders.female.name,
            ),
            DropdownMenuEntry(
              label: Genders.male.text,
              value: Genders.male.name,
            ),
            DropdownMenuEntry(
              label: Genders.genderless.text,
              value: Genders.genderless.name,
            ),
            DropdownMenuEntry(
              label: Genders.unknown.text,
              value: Genders.unknown.name,
            ),
          ]),
    );
  }

  DecoratedBox _status() {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: ColorTable.primaryColor),
      ),
      child: DropdownMenu(
          controller: controller.controllerList[FilterFields.status],
          label: CustomText(LocaleKeys.status.tr),
          dropdownMenuEntries: [
            DropdownMenuEntry(
              label: Status.alive.text,
              value: Status.alive.name,
            ),
            DropdownMenuEntry(
              label: Status.dead.text,
              value: Status.dead.name,
            ),
            DropdownMenuEntry(
              label: Status.unknown.text,
              value: Status.unknown.name,
            ),
          ]),
    );
  }

  CustomTextField _type() {
    return CustomTextField(
        contentPadding: EdgeInsets.all(StandartMeasurementUnits.normalPadding),
        label: LocaleKeys.type.tr,
        controller: controller.controllerList[FilterFields.type],
        color: ColorTable.primaryColor);
  }

  CustomTextField _species() {
    return CustomTextField(
        contentPadding: EdgeInsets.all(StandartMeasurementUnits.normalPadding),
        label: LocaleKeys.species.tr,
        controller: controller.controllerList[FilterFields.species],
        color: ColorTable.primaryColor);
  }
}
