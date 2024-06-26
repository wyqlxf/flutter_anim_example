import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/config/application.dart';
import 'package:flutter_anim_example/page/transition_anim/child/other_view.dart';
import 'package:get/get.dart';

class TransitionAnimLogic extends GetxController {
  void startPagePanUpDown() async {
    PageRouteBuilder routeBuilder = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const OtherView(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // const begin = Offset(0.0, 1.0);
        // const end = Offset.zero;
        // final tween = Tween(begin: begin, end: end);
        // final offsetAnimation = animation.drive(tween);
        // return SlideTransition(
        //   position: offsetAnimation,
        //   child: child,
        // );
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.ease,
        );
        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
    Navigator.of(Application().context).push(routeBuilder);
  }

  void startPagePanLeftRight() async {
    PageRouteBuilder routeBuilder = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const OtherView(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.ease,
        );
        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
    Navigator.of(Application().context).push(routeBuilder);
  }
}
