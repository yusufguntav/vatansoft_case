import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.width, this.height, this.buttonText, this.onPress, this.bgColor});
  final String? buttonText;
  final double? width;
  final double? height;

  final Function()? onPress;

  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bgColor, minimumSize: Size(width ?? double.infinity, height ?? Get.height * .08)),
        onPressed: onPress,
        child: CustomText(buttonText, textColor: Colors.white));
  }
}
