import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vatansoft_case/core/variables/color_table.dart';

import '../../../core/variables/standart_measurement_units.dart';
import 'custom_text.dart';

class ContentCard extends StatelessWidget {
  const ContentCard(
      {super.key, this.imagePathFromAsset, this.title, this.onTap, this.imagePathFromNetwork, this.width, this.imageHeight});
  final String? imagePathFromAsset;
  final String? imagePathFromNetwork;
  final double? width;
  final double? imageHeight;
  final String? title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      //TODO unconrained box
      child: UnconstrainedBox(
        child: SizedBox(
          width: width ?? Get.width * 0.6,
          child: Card(
            semanticContainer: false,
            //TODO lerp
            shape: ShapeBorder.lerp(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(StandartMeasurementUnits.normalRadius)),
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(StandartMeasurementUnits.normalRadius)),
              1,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: width ?? Get.width * 0.6,
                  height: imageHeight ?? Get.height * .25,
                  child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(StandartMeasurementUnits.normalRadius)),
                      child: imagePathFromAsset != null
                          ? Image.asset(imagePathFromAsset!, fit: BoxFit.fill)
                          : imagePathFromNetwork != null
                              ? Image.network(imagePathFromNetwork!, fit: BoxFit.fill)
                              : null),
                ),
                Padding(
                  padding: EdgeInsets.all(StandartMeasurementUnits.normalPadding),
                  child: CustomText(title),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
