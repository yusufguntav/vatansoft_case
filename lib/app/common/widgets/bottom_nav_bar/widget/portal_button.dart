import 'package:flutter/material.dart';
import 'package:vatansoft_case/app/common/widgets/circle_animation.dart';
import '../../../../../core/variables/enums.dart';

class PortalButton extends StatelessWidget {
  const PortalButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      onPressed: () async {},
      child: CircleAnimation(imagePath: Images.portal.path, speed: 30),
    );
  }
}
