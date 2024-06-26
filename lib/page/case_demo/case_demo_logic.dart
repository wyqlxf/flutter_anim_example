import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/route/route.dart';
import 'package:flutter_anim_example/page/case_demo/child/case1.dart';
import 'package:flutter_anim_example/page/case_demo/child/case2.dart';
import 'package:flutter_anim_example/page/case_demo/child/case3.dart';
import 'package:flutter_anim_example/page/case_demo/child/case4.dart';
import 'package:flutter_anim_example/page/case_demo/child/case5.dart';
import 'package:flutter_anim_example/page/case_demo/child/case6.dart';
import 'package:flutter_anim_example/page/case_demo/child/case7.dart';
import 'package:flutter_anim_example/page/case_demo/child/case8.dart';
import 'package:get/get.dart';

class CaseDemoLogic extends GetxController {
  List<Widget> pages = const [
    Case1(),
    Case2(),
    Case3(),
    Case4(),
    Case5(),
    Case6(),
    Case7(),
    Case8(),
  ];

  void startPageCase(int index) {
    RouteMgr.pushPage(pages[index]);
  }
}
