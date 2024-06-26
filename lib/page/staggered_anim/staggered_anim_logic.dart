import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaggeredAnimLogic extends GetxController {
  late AnimationController controller;
  late List<Animation<double>> animations;

  init(TickerProvider vsync) {
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: vsync,
    );
    animations = List.generate(10, (index) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            index * 0.1,
            (index + 1) * 0.1,
            curve: Curves.easeIn,
          ),
        ),
      );
    });
  }

  startAnimation() {
    if (controller.isCompleted) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
