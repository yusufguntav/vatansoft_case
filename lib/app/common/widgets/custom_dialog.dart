// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vatansoft_case/core/variables/standartMeasurementUnits.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, required this.content, this.showCloseButton = false, this.actions});
  final List<Widget>? actions;
  final bool showCloseButton;
  final Widget? content;
  @override
  Widget build(BuildContext context) => AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        titlePadding: EdgeInsets.zero,
        actions: actions,
        title: (showCloseButton)
            ? Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Get.back(),
                ),
              )
            : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(StandartMeasurementUnits.lowRadius)),
        contentPadding: EdgeInsets.fromLTRB(StandartMeasurementUnits.highPadding, StandartMeasurementUnits.normalPadding,
            StandartMeasurementUnits.highPadding, StandartMeasurementUnits.normalPadding),
        content: content,
      );
}
