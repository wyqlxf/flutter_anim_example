import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/res/color.dart';
import 'package:flutter_anim_example/common/util/random_util.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';
import 'package:flutter_anim_example/page/hero_anim/widget/photo_hero.dart';
import 'package:get/get.dart';

import 'hero_anim_logic.dart';

/// Hero动画页面，Flutter 中的Hero widget 实现的动画类型也称为共享元素过渡或共享元素动画
class HeroAnimPage extends StatefulWidget {
  const HeroAnimPage({super.key});

  @override
  State<HeroAnimPage> createState() => _HeroAnimPageState();
}

class _HeroAnimPageState extends State<HeroAnimPage> {
  final logic = Get.put(HeroAnimLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget('Hero动画'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorRes.colorFFFFFF,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            Color color = RandomUtil.randomColor();
            return InkWell(
              onTap: () {
                logic.startPageHero('photo$index', color: color);
              },
              child: PhotoHero(
                tag: 'photo$index',
                width: 100,
                color: color,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<HeroAnimLogic>();
    super.dispose();
  }
}
