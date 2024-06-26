import 'package:flutter/material.dart';
import 'package:flutter_anim_example/page/case_demo/case_demo_view.dart';
import 'package:flutter_anim_example/page/explicit_anim/explicit_anim_view.dart';
import 'package:flutter_anim_example/page/hero_anim/hero_anim_view.dart';
import 'package:flutter_anim_example/page/home/home_view.dart';
import 'package:flutter_anim_example/page/implicitly_anim/implicitly_anim_view.dart';
import 'package:flutter_anim_example/page/internal_anim/internal_anim_view.dart';
import 'package:flutter_anim_example/page/list_anim/list_anim_view.dart';
import 'package:flutter_anim_example/page/physics_anim/physics_anim_view.dart';
import 'package:flutter_anim_example/page/staggered_anim/staggered_anim_view.dart';
import 'package:flutter_anim_example/page/transition_anim/transition_anim_view.dart';
import 'package:flutter_anim_example/page/tween_anim/tween_anim_view.dart';
import 'package:get/get.dart';

class RouteMgr {
  // 首页
  static const String root = '/';

  // 隐式动画
  static const String implicit = '/implicit';

  // 显示动画
  static const String explicit = '/explicit';

  // 补间动画
  static const String tween = '/tween';

  // 物理动画
  static const String physics = '/physics';

  // 交错动画
  static const String staggered = '/staggered';

  // hero动画
  static const String hero = '/hero';

  // 页面转场动画
  static const String transition = '/transition';

  // 预置动画
  static const String internal = '/internal';

  // 列表动画
  static const String listAnim = '/listAnim';

  // 案例示范
  static const String caseDemo = '/caseDemo';

  static List<GetPage> routes = <GetPage>[
    GetPage(
      name: root,
      page: () => const HomePage(),
    ),
    GetPage(
      name: implicit,
      page: () => const ImplicitlyAnimPage(),
    ),
    GetPage(
      name: explicit,
      page: () => const ExplicitAnimPage(),
    ),
    GetPage(
      name: tween,
      page: () => const TweenAnimPage(),
    ),
    GetPage(
      name: physics,
      page: () => const PhysicsAnimPage(),
    ),
    GetPage(
      name: staggered,
      page: () => const StaggeredAnimPage(),
    ),
    GetPage(
      name: hero,
      page: () => const HeroAnimPage(),
    ),
    GetPage(
      name: transition,
      page: () => const TransitionAnimPage(),
    ),
    GetPage(
      name: internal,
      page: () => const InternalAnimPage(),
    ),
    GetPage(
      name: listAnim,
      page: () => const ListAnimPage(),
    ),
    GetPage(
      name: caseDemo,
      page: () => const CaseDemoPage(),
    ),
  ];

  static Future<dynamic>? pushNamed(String routeName) {
    return Get.toNamed(routeName);
  }

  static Future<dynamic>? pushPage(Widget widget) {
    return Get.to(widget);
  }

  static void goBack() {
    Get.back();
  }
}
