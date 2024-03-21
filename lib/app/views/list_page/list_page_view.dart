import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vatansoft_case/app/common/widgets/content_card.dart';
import 'package:vatansoft_case/app/common/widgets/circle_animation.dart';
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
            onPressed: () {
              Get.dialog(
                CustomDialog(
                  showCloseButton: true,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextField(
                          label: "Species (Human, Alien, etc.)",
                          controller: controller.controllerList[FilterFields.species],
                          color: ColorTable.primaryColor),
                      SizedBox(height: StandartMeasurementUnits.normalPadding),
                      CustomTextField(
                          label: "Type",
                          controller: controller.controllerList[FilterFields.species],
                          color: ColorTable.primaryColor),
                      SizedBox(height: StandartMeasurementUnits.normalPadding),
                      //TODO Buradan devam bro
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorTable.primaryColor),
                        ),
                        child: DropdownMenu(
                            label: CustomText("Status"),
                            menuStyle: MenuStyle(),
                            enableFilter: true,
                            dropdownMenuEntries: [
                              DropdownMenuEntry(
                                label: "Unselected",
                                value: "unselected",
                              ),
                              DropdownMenuEntry(
                                label: "Alive",
                                value: "alive",
                              ),
                              DropdownMenuEntry(
                                label: "Dead",
                                value: "dead",
                              ),
                              DropdownMenuEntry(
                                label: "Unkown",
                                value: "unkown",
                              ),
                            ]),
                      ),
                      SizedBox(height: StandartMeasurementUnits.normalPadding),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorTable.primaryColor),
                        ),
                        child: DropdownMenu(
                            label: CustomText("Gender"),
                            menuStyle: MenuStyle(),
                            enableFilter: true,
                            dropdownMenuEntries: [
                              DropdownMenuEntry(
                                label: "Unselected",
                                value: "unselected",
                              ),
                              DropdownMenuEntry(
                                label: "Female",
                                value: "female",
                              ),
                              DropdownMenuEntry(
                                label: "Male",
                                value: "male",
                              ),
                              DropdownMenuEntry(
                                label: "Genderless",
                                value: "genderless",
                              ),
                              DropdownMenuEntry(
                                label: "Unkown",
                                value: "unkown",
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      content: [
        SizedBox(
          width: Get.width * .8,
          child: CustomTextField(
            prefixIcon: const Icon(Icons.search),
            controller: controller.controllerList[FilterFields.name],
            onchange: (p0) async {
              if (p0.length == 1) controller.resetPageNumber();
              await controller.getCharacters();
              controller.characters.clear();
              if (p0 == "") controller.resetPageNumber();
            },
          ),
        ),
        SizedBox(height: StandartMeasurementUnits.normalPadding),
        Obx(
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
        ),
      ],
    );
  }
}
