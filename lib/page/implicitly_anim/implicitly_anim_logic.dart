import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/res/color.dart';
import 'package:flutter_anim_example/common/route/route.dart';
import 'package:flutter_anim_example/common/util/random_util.dart';
import 'package:flutter_anim_example/page/implicitly_anim/child/more_view.dart';
import 'package:flutter_anim_example/page/implicitly_anim/entity/container_param.dart';
import 'package:flutter_anim_example/page/implicitly_anim/painter/hexagon_painter.dart';
import 'package:flutter_anim_example/page/implicitly_anim/painter/triangle_painter.dart';
import 'package:get/get.dart';

class ImplicitlyAnimLogic extends GetxController {
  RxDouble opacity = 1.0.obs;

  RxDouble sliverOpacity = 1.0.obs;

  Rx<ContainerParam> containerParam = ContainerParam(
    id: 1,
    width: 200,
    height: 102,
    color: Colors.red,
    alignment: Alignment.center,
    margin: const EdgeInsets.all(24),
    padding: EdgeInsets.zero,
    child: const Text(
      '红色矩形',
      style: TextStyle(color: Colors.white),
    ),
  ).obs;

  RxDouble paddingTop = 0.0.obs;

  RxDouble rocketTop = 0.0.obs;

  Rx<TextStyle> textStyle = const TextStyle(
    color: Colors.blue,
    fontSize: 12,
  ).obs;

  RxBool cross = false.obs;

  RxBool switcher = false.obs;

  RxDouble start = 110.0.obs;

  RxDouble scale = 1.0.obs;

  RxDouble turns = 0.0.obs;

  Rx<Alignment> align = Alignment.center.obs;

  Rx<Offset> offset = const Offset(0, 0).obs;

  final Color animAreaColor = ColorRes.colorE5E5E5;

  RxBool isToggled = true.obs;

  RxBool isExpanded = false.obs;

  RxBool isTween = false.obs;

  final List<DropdownMenuEntry<Curve>> curves = [];

  Curve curve = Curves.linear;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  changeOpacity() {
    opacity.value = (opacity.value == 1.0 ? 0.1 : 1.0);
  }

  changeSliverOpacity() {
    sliverOpacity.value = (sliverOpacity.value == 1.0 ? 0 : 1.0);
  }

  changeShape() {
    // 注意： width height 约束条件从无界切换到有界，这种情况可能会导致无法有效处理约束条件
    // 错误信息：Cannot interpolate between finite constraints and unbounded constraints.
    ContainerParam newContainerParam;
    switch (containerParam.value.id) {
      case 0:
        newContainerParam = ContainerParam(
          id: 1,
          width: 200,
          height: 102,
          color: Colors.red,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(24),
          padding: EdgeInsets.zero,
          child: const Text(
            '红色矩形',
            style: TextStyle(color: Colors.white),
          ),
        );
        break;
      case 1:
        newContainerParam = ContainerParam(
          id: 2,
          width: 200,
          height: 102,
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.all(24),
          padding: EdgeInsets.zero,
          child: const Text(
            '橙色圆角矩形',
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(24),
          ),
        );
        break;
      case 2:
        newContainerParam = ContainerParam(
          id: 3,
          width: 102,
          height: 102,
          color: Colors.yellow,
          alignment: Alignment.center,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          child: const Text(
            '黄色正方形',
            style: TextStyle(color: Colors.white),
          ),
        );
        break;
      case 3:
        newContainerParam = ContainerParam(
          id: 4,
          width: 102,
          height: 102,
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.symmetric(horizontal: 48),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Text(
            '绿色圆角正方形',
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(24),
          ),
        );
        break;
      case 4:
        newContainerParam = ContainerParam(
          id: 5,
          width: 102,
          height: 102,
          alignment: Alignment.center,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          child: const Text(
            '青色圆形',
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(51),
          ),
        );
        break;
      case 5:
        newContainerParam = ContainerParam(
          id: 6,
          width: 102,
          height: 102,
          alignment: Alignment.center,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          child: Stack(
            children: [
              SizedBox(
                width: 102,
                height: 102,
                child: CustomPaint(
                  painter: TrianglePainter(),
                ),
              ),
              const Center(
                child: Text(
                  '蓝色三角形',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
        break;
      default:
        newContainerParam = ContainerParam(
          id: 0,
          width: 102,
          height: 102,
          alignment: Alignment.center,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          child: Stack(
            children: [
              SizedBox(
                width: 102,
                height: 102,
                child: CustomPaint(
                  painter: HexagonPainter(),
                ),
              ),
              const Center(
                child: Text(
                  '紫色六边形',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
        break;
    }
    containerParam.value = newContainerParam;
  }

  changePadding() {
    paddingTop.value = (paddingTop.value == 0.0 ? 90.0 : 0.0);
  }

  changeRocketTop() {
    rocketTop.value = (rocketTop.value == 0.0 ? 90.0 : 0.0);
  }

  changeTextStyle() {
    if (textStyle.value.fontSize == 12) {
      textStyle.value = const TextStyle(
        color: Colors.red,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );
    } else {
      textStyle.value = const TextStyle(
        color: Colors.blue,
        fontSize: 12,
      );
    }
  }

  changeCross() {
    cross.value = !cross.value;
  }

  changeSwitcher() {
    switcher.value = !switcher.value;
  }

  changeAlign() {
    if (align.value == Alignment.topLeft) {
      align.value = Alignment.topRight;
    } else if (align.value == Alignment.topRight) {
      align.value = Alignment.bottomLeft;
    } else if (align.value == Alignment.bottomLeft) {
      align.value = Alignment.bottomRight;
    } else if (align.value == Alignment.bottomRight) {
      align.value = Alignment.center;
    } else {
      align.value = Alignment.topLeft;
    }
  }

  changeStart() {
    start.value = (start.value == 0.0 ? 50 + RandomUtil.randomStart() : 0.0);
  }

  changeScale() {
    scale.value = (scale.value == 1.0 ? 2.0 : 1.0);
  }

  changeTurns() {
    turns.value = (turns.value == 0.0 ? 3.0 : 0.0);
  }

  changeOffset() {
    offset.value = (offset.value == const Offset(0, 0)
        ? RandomUtil.randomOffset()
        : const Offset(0, 0));
  }

  changeToggled() {
    isToggled.value = !isToggled.value;
  }

  changeExpanded() {
    isExpanded.value = !isExpanded.value;
  }

  changeTween() {
    isTween.value = !isTween.value;
  }

  initData() {
    curves.clear();
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.linear, label: 'linear'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.decelerate, label: 'decelerate'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.ease, label: 'ease'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeIn, label: 'easeIn'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeInBack, label: 'easeInBack'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeInCirc, label: 'easeInCirc'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeInCubic, label: 'easeInCubic'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeInExpo, label: 'easeInExpo'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeInOut, label: 'easeInOut'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeInOutBack, label: 'easeInOutBack'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeInOutCirc, label: 'easeInOutCirc'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeInOutCubic, label: 'easeInOutCubic'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeInOutExpo, label: 'easeInOutExpo'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeInOutQuad, label: 'easeInOutQuad'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeInOutQuart, label: 'easeInOutQuart'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeInOutQuint, label: 'easeInOutQuint'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeInOutSine, label: 'easeInOutSine'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeInQuad, label: 'easeInQuad'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeInQuart, label: 'easeInQuart'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeInQuint, label: 'easeInQuint'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeInSine, label: 'easeInSine'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeOut, label: 'easeOut'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeOutBack, label: 'easeOutBack'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeOutCirc, label: 'easeOutCirc'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeOutCubic, label: 'easeOutCubic'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeOutExpo, label: 'easeOutExpo'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeOutQuad, label: 'easeOutQuad'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeOutQuart, label: 'easeOutQuart'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeOutQuint, label: 'easeOutQuint'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.easeOutSine, label: 'easeOutSine'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.elasticIn, label: 'elasticIn'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.elasticInOut, label: 'elasticInOut'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.elasticOut, label: 'elasticOut'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.fastLinearToSlowEaseIn, label: 'fastLinearToSlowEaseIn'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.fastOutSlowIn, label: 'fastOutSlowIn'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.bounceIn, label: 'bounceIn'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.bounceInOut, label: 'bounceInOut'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.bounceOut, label: 'bounceOut'));
    curves.add(const DropdownMenuEntry<Curve>(value: Curves.slowMiddle, label: 'slowMiddle'));
  }

  startPageMore() async {
    RouteMgr.pushPage(const MorePage());
  }

  @override
  void onClose() {
    opacity.close();
    rocketTop.close();
    paddingTop.close();
    textStyle.close();
    cross.close();
    switcher.close();
    align.close();
    start.close();
    scale.close();
    turns.close();
    isToggled.close();
    isExpanded.close();
    isTween.close();
    sliverOpacity.close();
    super.onClose();
  }
}
