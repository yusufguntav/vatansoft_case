import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.buttonText, this.onPress, this.bgColor});
  final String? buttonText;
  final Function()? onPress;

  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: bgColor, minimumSize: Size(double.infinity, Get.height * .08)),
        onPressed: onPress,
        child: CustomText(buttonText, textColor: Colors.white));
  }
}
