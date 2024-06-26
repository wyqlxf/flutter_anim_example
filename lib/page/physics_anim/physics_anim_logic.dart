import 'package:flutter_anim_example/common/route/route.dart';
import 'package:flutter_anim_example/page/physics_anim/child/grid_view.dart';
import 'package:flutter_anim_example/page/physics_anim/child/list_view.dart';
import 'package:flutter_anim_example/page/physics_anim/child/list_wheel_view.dart';
import 'package:flutter_anim_example/page/physics_anim/child/page_view.dart';
import 'package:flutter_anim_example/page/physics_anim/child/spring_view.dart';
import 'package:get/get.dart';

class PhysicsAnimLogic extends GetxController {
  startPageSpring() async {
    RouteMgr.pushPage(const SpringPage());
  }

  startPageListView() async {
    RouteMgr.pushPage(const ListPage());
  }

  startPageListWheelView() async {
    RouteMgr.pushPage(const ListWheelPage());
  }

  startPageGridView() async {
    RouteMgr.pushPage(const GridPage());
  }

  startPagePageView() async {
    RouteMgr.pushPage(const PageViewPage());
  }
}
