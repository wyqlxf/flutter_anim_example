import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/res/color.dart';
import 'package:flutter_anim_example/common/route/route.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';
import 'package:flutter_anim_example/page/hero_anim/widget/photo_hero.dart';
import 'package:get/get.dart';

class HeroAnimLogic extends GetxController {
  startPageHero(String tag, {Color? color}) async {
    Widget child = Scaffold(
      appBar: const AppBarWidget('Hero动画'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorRes.colorF0F0F0,
        child: PhotoHero(
          tag: tag,
          width: 360,
          color: color,
          onTap: () {
            RouteMgr.goBack();
          },
        ),
      ),
    );
    RouteMgr.pushPage(child);
  }
}
