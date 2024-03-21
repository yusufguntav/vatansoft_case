import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleAnimation extends StatefulWidget {
  const CircleAnimation({super.key, required this.imagePath, this.speed = 2});
  final String imagePath;
  final int speed;
  @override
  State<CircleAnimation> createState() => _CircleAnimationState();
}

class _CircleAnimationState extends State<CircleAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.speed),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 2 * 3.141,
    ).animate(_controller);

    _controller.repeat();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation.value,
          child: Image.asset(
            widget.imagePath,
            width: Get.width * .5,
          ),
        );
      },
    );
  }
}
