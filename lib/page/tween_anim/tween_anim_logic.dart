import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TweenAnimLogic extends GetxController {
  late List<AnimationController> controllers;
  late List<Animation<double>> animations;

  bool isFlipX = false;
  bool isFlipY = false;

  init(TickerProvider vsync) {
    controllers = List.generate(4, (index) {
      return AnimationController(
        vsync: vsync,
        duration: const Duration(milliseconds: 300),
      );
    });

    animations = controllers.mapIndexed((index, controller) {
      switch (index) {
        case 0:
          return Tween<double>(begin: 0.0, end: 2 * 3.14).animate(
            CurvedAnimation(
              parent: controller,
              curve: Curves.easeInOut,
            ),
          );
        case 1:
          return Tween<double>(begin: 0, end: 100).animate(
            CurvedAnimation(
              parent: controller,
              curve: Curves.easeInOut,
            ),
          );
        case 2:
          return Tween<double>(begin: 1.0, end: 2.0).animate(
            CurvedAnimation(
              parent: controller,
              curve: Curves.easeInOut,
            ),
          )..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                controller.reverse();
              }
            });
        case 3:
          return Tween<double>(begin: 100, end: 200).animate(
            CurvedAnimation(
              parent: controller,
              curve: Curves.easeInOut,
            ),
          )..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                controller.reverse();
              }
            });
      }
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      );
    }).toList();
  }

  void startAnimation(int index) {
    if (controllers.length > index && index >= 0) {
      if (controllers[index].isDismissed) {
        controllers[index].forward();
      } else {
        controllers[index].reverse();
      }
    }
  }

  void flip() {
    isFlipX = !isFlipX;
    isFlipY = !isFlipY;
    update(['flip']);
  }

  @override
  void onClose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.onClose();
  }
}

extension IterableIndexed<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(int index, E e) f) sync* {
    var index = 0;
    for (var element in this) {
      yield f(index, element);
      index++;
    }
  }
}
