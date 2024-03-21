import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vatansoft_case/app/common/widgets/circle_animation.dart';
import 'package:vatansoft_case/app/views/splash/splash_page_controller.dart';
import 'package:vatansoft_case/core/variables/enums.dart';

class SplashPage extends GetView<SplashScreenController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircleAnimation(imagePath: Images.portalRNM.path)],
        ),
      ),
    );
  }
}
