// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../core/utils/custom_color_selection_handle.dart';
import '../../../core/variables/color_table.dart';
import '../../../core/variables/standart_measurement_units.dart';
import 'custom_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.isValidController,
      required this.controller,
      this.color,
      this.label = '',
      this.required = false,
      this.isEnable,
      this.onchange,
      this.contentPadding,
      this.prefixIcon,
      this.obscureText,
      this.onTap});
  final Function? isValidController;
  final TextEditingController? controller;
  final bool required;
  final Function()? onTap;
  final Function(String)? onchange;
  final Widget? prefixIcon;
  final bool? isEnable;
  final EdgeInsetsGeometry? contentPadding;
  final String label;
  final Color? color;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TextField(
        onChanged: (value) {
          if (onchange != null) onchange!(value);
        },
        obscureText: obscureText ?? false,
        enabled: isEnable,
        selectionControls: color != null ? CustomColorSelectionHandle(color!) : null,
        cursorColor: color,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: contentPadding ?? EdgeInsets.zero,
          prefixIcon: prefixIcon,
          label: CustomText(required ? '$label*' : label),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(StandartMeasurementUnits.normalRadius),
            borderSide: color != null ? BorderSide(color: color!, width: 2) : const BorderSide(width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(StandartMeasurementUnits.normalRadius),
            borderSide: color != null ? BorderSide(color: color!, width: 2) : const BorderSide(width: 2),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(StandartMeasurementUnits.normalRadius),
            borderSide: color != null ? BorderSide(color: color!, width: 2) : const BorderSide(width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(StandartMeasurementUnits.normalRadius),
            borderSide: BorderSide(color: ColorTable.getNegativeColor, width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(StandartMeasurementUnits.normalRadius),
            borderSide: BorderSide(color: ColorTable.getNegativeColor, width: 2.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(StandartMeasurementUnits.normalRadius),
            borderSide: color != null ? BorderSide(color: color!, width: 2) : const BorderSide(width: 2),
          ),
        ),
      ),
    );
  }
}
