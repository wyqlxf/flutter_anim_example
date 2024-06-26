import 'package:flutter_anim_example/common/route/route.dart';
import 'package:flutter_anim_example/page/internal_anim/child/container_transition.dart';
import 'package:flutter_anim_example/page/internal_anim/child/fade_scale_transition.dart';
import 'package:flutter_anim_example/page/internal_anim/child/fade_through_transition.dart';
import 'package:flutter_anim_example/page/internal_anim/child/shared_axis_transition.dart';
import 'package:get/get.dart';

class InternalAnimLogic extends GetxController {
  startPage1() async {
    RouteMgr.pushPage(const OpenContainerTransformDemo());
  }

  startPage2() async {
    RouteMgr.pushPage(const SharedAxisTransitionDemo());
  }

  startPage3() async {
    RouteMgr.pushPage(const FadeThroughTransitionDemo());
  }

  startPage4() async {
    RouteMgr.pushPage(const FadeScaleTransitionDemo());
  }
}
