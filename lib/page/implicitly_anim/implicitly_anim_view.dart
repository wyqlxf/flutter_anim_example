import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/res/color.dart';
import 'package:flutter_anim_example/common/util/log_util.dart';
import 'package:flutter_anim_example/common/util/random_util.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';
import 'package:get/get.dart';

import 'implicitly_anim_logic.dart';

const colDivider = Divider(
  indent: 16,
  endIndent: 16,
  height: 32,
  thickness: 1,
  color: ColorRes.colorE5E5E5,
);

/// 隐式动画页面（动画效果无需开发者管理动画控制器等细节，当属性值发生变化时，自动产生动画效果）
class ImplicitlyAnimPage extends StatefulWidget {
  const ImplicitlyAnimPage({super.key});

  @override
  State<ImplicitlyAnimPage> createState() => _ImplicitlyAnimPageState();
}

class _ImplicitlyAnimPageState extends State<ImplicitlyAnimPage> {
  final logic = Get.put(ImplicitlyAnimLogic());

  @override
  void initState() {
    LogUtil.log('_ImplicitlyAnimPageState.initState');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.log('_ImplicitlyAnimPageState.build');
    return Scaffold(
      appBar: AppBarWidget(
        '隐式动画',
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {
              // 点击右上角更多按钮
              logic.startPageMore();
            },
          ),
        ],
      ),
      body: GetBuilder<ImplicitlyAnimLogic>(
        builder: (logic) {
          return body();
        },
      ),
    );
  }

  Widget body() {
    // 所有隐式动画都扩展了 ImplicitlyAnimatedWidget 类，除了 AnimatedCrossFade 和 AnimatedSwitcher
    // AnimatedCrossFade 组件实现了隐式动画，但并未直接继承 ImplicitlyAnimatedWidget。实际上，它内部使用了 AnimatedSize 和 FadeTransition 等来实现交叉淡入淡出的效果
    // AnimatedSwitcher 组件用于在一个子组件和另一个子组件之间进行动画切换。它也没有直接继承 ImplicitlyAnimatedWidget，而是用了 AnimatedSwitcherTransitionBuilder 和 FadeTransition 等来实现
    // 如果你没有指定 curve，隐式动画的曲线会默认使用 线性曲线。
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorRes.colorFFFFFF,
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _widget1(),
                  colDivider,
                  widget2(),
                  colDivider,
                  widget3(),
                  colDivider,
                  widget4(),
                  colDivider,
                  widget5(),
                  colDivider,
                  widget6(),
                  colDivider,
                  widget7(),
                  colDivider,
                  widget8(),
                  colDivider,
                  widget9(),
                  colDivider,
                  widget10(),
                  colDivider,
                  widget11(),
                  colDivider,
                  widget12(),
                  colDivider,
                  widget13(),
                  colDivider,
                  widget14(),
                  colDivider,
                  widget15(),
                  colDivider,
                  widget16(),
                  colDivider,
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: curveMenu(),
          ),
        ],
      ),
    );
  }

  Widget curveMenu() {
    return Container(
      width: double.infinity,
      height: 100,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '曲线：',
            style: TextStyle(
                fontSize: 16,
                color: ColorRes.color333333,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(width: 16),
          DropdownMenu<Curve>(
            width: 220,
            menuHeight: 560,
            initialSelection: logic.curve,
            label: Text(logic.curve.toString()),
            dropdownMenuEntries: logic.curves,
            onSelected: (curve) {
              if (curve != null) {
                setState(() {
                  logic.curve = curve;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _widget1() {
    return _item(
      '淡入淡出',
      'AnimatedOpacity',
      Obx(
        () => AnimatedOpacity(
          opacity: logic.opacity.value,
          curve: logic.curve,
          duration: const Duration(seconds: 1),
          child: const Column(
            children: [
              Text('Age: 28'),
              Text('Sex: Male'),
              Text('Name: Zhang san'),
              Divider(
                height: 16,
                thickness: 2,
                indent: 16,
                endIndent: 16,
                color: ColorRes.color5C93FF,
              ),
            ],
          ),
          onEnd: () {
            // 隐式动画的结束回调
          },
        ),
      ),
      onPressed: () {
        logic.changeOpacity();
      },
    );
  }

  Widget widget2() {
    return _item(
      '形状变化',
      'AnimatedContainer',
      Container(
        width: double.infinity,
        height: 150,
        color: logic.animAreaColor,
        child: Obx(
          () => Center(
            child: AnimatedContainer(
              width: logic.containerParam.value.width,
              height: logic.containerParam.value.height,
              margin: logic.containerParam.value.margin,
              padding: logic.containerParam.value.padding,
              alignment: logic.containerParam.value.alignment,
              decoration: logic.containerParam.value.decoration,
              color: logic.containerParam.value.color,
              curve: logic.curve,
              duration: const Duration(milliseconds: 400),
              onEnd: () {
                // 隐式动画的结束回调
              },
              child: logic.containerParam.value.child,
            ),
          ),
        ),
      ),
      onPressed: () {
        logic.changeShape();
      },
    );
  }

  Widget widget3() {
    return _item(
      '文本变化',
      'AnimatedDefaultTextStyle',
      Center(
        child: Container(
          width: double.infinity,
          height: 150,
          color: logic.animAreaColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => AnimatedDefaultTextStyle(
                  curve: logic.curve,
                  duration: const Duration(milliseconds: 500),
                  style: logic.textStyle.value,
                  child: const Text(
                    "Hello World!",
                  ),
                  onEnd: () {
                    // 隐式动画的结束回调
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        logic.changeTextStyle();
      },
    );
  }

  Widget widget4() {
    return _item(
      '交叉变化',
      'AnimatedCrossFade',
      Center(
        child: Container(
          width: double.infinity,
          height: 150,
          color: logic.animAreaColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => AnimatedCrossFade(
                  firstCurve: Curves.fastOutSlowIn,
                  crossFadeState: logic.cross.value
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 400),
                  firstChild: const Icon(
                    Icons.radio_button_unchecked,
                    size: 48,
                    color: ColorRes.color3D86D4,
                  ),
                  secondChild: const Icon(
                    Icons.check_circle,
                    size: 48,
                    color: ColorRes.color3D86D4,
                  ),
                  alignment: Alignment.centerLeft,
                  sizeCurve: Curves.easeInOut,
                ),
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        logic.changeCross();
      },
    );
  }

  Widget widget5() {
    return _item(
      '切换变化',
      'AnimatedSwitcher',
      Center(
        child: Container(
          width: double.infinity,
          height: 150,
          color: logic.animAreaColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => AnimatedSwitcher(
                  switchInCurve: logic.curve,
                  switchOutCurve: logic.curve,
                  duration: const Duration(seconds: 1),
                  child: logic.switcher.value
                      ? const Icon(
                          Icons.radio_button_unchecked,
                          size: 48,
                          color: ColorRes.color3D86D4,
                        )
                      : const Icon(
                          Icons.check_circle,
                          size: 48,
                          color: ColorRes.color3D86D4,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        logic.changeSwitcher();
      },
    );
  }

  Widget widget6() {
    return _item(
      '填充变化',
      'AnimatedPadding',
      Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: logic.animAreaColor,
            child: Obx(
              () => AnimatedPadding(
                padding: EdgeInsets.only(
                    top: logic.paddingTop.value, left: 110, right: 110),
                curve: logic.curve,
                duration: const Duration(milliseconds: 400),
                onEnd: () {
                  // 隐式动画的结束回调
                },
                child: Container(
                  color: ColorRes.color5C93FF,
                ),
              ),
            ),
          )
        ],
      ),
      onPressed: () {
        logic.changePadding();
      },
    );
  }

  Widget widget7() {
    return _item(
      '定位变化',
      'AnimatedPositioned',
      Center(
        child: Container(
          width: double.infinity,
          height: 150,
          color: logic.animAreaColor,
          child: Stack(
            children: [
              Obx(
                () => AnimatedPositioned(
                  width: 60,
                  height: 150,
                  top: logic.rocketTop.value,
                  left: 110,
                  curve: logic.curve,
                  duration: const Duration(milliseconds: 400),
                  onEnd: () {
                    // 隐式动画的结束回调
                  },
                  child: Container(
                    color: ColorRes.color5C93FF,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        logic.changeRocketTop();
      },
    );
  }

  Widget widget8() {
    return _item(
      '定向变化',
      'AnimatedPositionedDirectional',
      Container(
        width: double.infinity,
        height: 150,
        color: logic.animAreaColor,
        child: Stack(
          children: [
            Obx(
              () => AnimatedPositionedDirectional(
                curve: logic.curve,
                duration: const Duration(milliseconds: 200),
                start: logic.start.value,
                top: 45,
                child: Container(
                  width: 60,
                  height: 60,
                  color: ColorRes.color5C93FF,
                ),
                onEnd: () {
                  // 隐式动画的结束回调
                },
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        logic.changeStart();
      },
    );
  }

  Widget widget9() {
    return _item(
      '对齐变化',
      'AnimatedAlign',
      Center(
        child: Container(
          width: double.infinity,
          height: 150,
          color: logic.animAreaColor,
          child: Stack(
            children: [
              Obx(
                () => AnimatedAlign(
                  duration: const Duration(milliseconds: 200),
                  curve: logic.curve,
                  alignment: logic.align.value,
                  child: Container(
                    width: 60,
                    height: 60,
                    color: ColorRes.color5C93FF,
                  ),
                  onEnd: () {
                    // 隐式动画的结束回调
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        logic.changeAlign();
      },
    );
  }

  Widget widget10() {
    return _item(
      '缩放变化',
      'AnimatedScale',
      Container(
        width: double.infinity,
        height: 150,
        color: logic.animAreaColor,
        child: Stack(
          children: [
            Obx(
              () => Center(
                child: AnimatedScale(
                  scale: logic.scale.value,
                  alignment: Alignment.center,
                  curve: logic.curve,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 60,
                    height: 60,
                    color: ColorRes.color5C93FF,
                  ),
                  onEnd: () {
                    // 隐式动画的结束回调
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        logic.changeScale();
      },
    );
  }

  Widget widget11() {
    return _item(
      '旋转变化',
      'AnimatedRotation',
      Container(
        width: double.infinity,
        height: 150,
        color: logic.animAreaColor,
        child: Stack(
          children: [
            Obx(
              () => Center(
                child: AnimatedRotation(
                  turns: logic.turns.value,
                  alignment: Alignment.center,
                  curve: logic.curve,
                  duration: const Duration(seconds: 3),
                  child: const Icon(
                    Icons.refresh,
                    size: 60,
                    color: ColorRes.color5C93FF,
                  ),
                  onEnd: () {
                    // 隐式动画的结束回调
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        logic.changeTurns();
      },
    );
  }

  Widget widget12() {
    return _item(
      '滑动变化',
      'AnimatedSlide',
      Container(
        width: double.infinity,
        height: 150,
        color: logic.animAreaColor,
        child: Stack(
          children: [
            Obx(
              () => Center(
                child: AnimatedSlide(
                  offset: logic.offset.value,
                  curve: logic.curve,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(
                    Icons.directions_run,
                    size: 60,
                    color: ColorRes.color5C93FF,
                  ),
                  onEnd: () {
                    // 隐式动画的结束回调
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        logic.changeOffset();
      },
    );
  }

  Widget widget13() {
    return _item(
      '透明变化',
      'SliverAnimatedOpacity',
      Container(
        width: double.infinity,
        height: 150,
        color: logic.animAreaColor,
        child: CustomScrollView(
          slivers: [
            Obx(
              () => SliverAnimatedOpacity(
                opacity: logic.sliverOpacity.value,
                curve: logic.curve,
                duration: const Duration(milliseconds: 500),
                sliver: SliverFixedExtentList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        color: RandomUtil.randomColor(),
                        alignment: Alignment.center,
                        child: Text(
                          'Item $index',
                          style: const TextStyle(
                            color: ColorRes.colorFFFFFF,
                            fontSize: 14,
                          ),
                        ),
                      );
                    },
                    childCount: 10,
                  ),
                  itemExtent: 50,
                ),
                onEnd: () {
                  // 隐式动画的结束回调
                },
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        logic.changeSliverOpacity();
      },
    );
  }

  Widget widget14() {
    return _item(
      '物理变化',
      'AnimatedPhysicalModel',
      SizedBox(
        width: double.infinity,
        height: 150,
        child: Obx(
          () => AnimatedPhysicalModel(
            curve: logic.curve,
            shape: BoxShape.rectangle,
            elevation: logic.isToggled.value ? 0 : 16,
            duration: const Duration(milliseconds: 500),
            color: logic.isToggled.value
                ? ColorRes.colorAEEBDD
                : ColorRes.color4D93F7,
            shadowColor: logic.isToggled.value
                ? ColorRes.colorAEEBDD
                : ColorRes.color4D93F7,
            borderRadius: BorderRadius.circular(logic.isToggled.value ? 0 : 16),
            child: const Center(
              child: Text(
                'Hello World!',
                style: TextStyle(
                  color: ColorRes.colorFFFFFF,
                  fontSize: 24,
                ),
              ),
            ),
            onEnd: () {
              // 隐式动画的结束回调
            },
          ),
        ),
      ),
      onPressed: () {
        logic.changeToggled();
      },
    );
  }

  Widget widget15() {
    return _item(
      '展开变化',
      'AnimatedFractionallySizedBox',
      Container(
        width: double.infinity,
        height: 150,
        color: logic.animAreaColor,
        child: Obx(
          () => AnimatedFractionallySizedBox(
            duration: const Duration(seconds: 1),
            widthFactor: logic.isExpanded.value ? 1.0 : 0.5,
            heightFactor: logic.isExpanded.value ? 1.0 : 0.5,
            alignment: Alignment.center,
            child: Container(
              color: ColorRes.color5C93FF,
              alignment: Alignment.center,
              child: Text(
                logic.isExpanded.value ? '收缩' : '展开',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
      onPressed: () {
        logic.changeExpanded();
      },
    );
  }

  Widget widget16() {
    return _item(
      '补间变化',
      'TweenAnimationBuilder',
      Container(
        width: double.infinity,
        height: 150,
        color: logic.animAreaColor,
        child: Obx(
          () => TweenAnimationBuilder<Color?>(
            tween: ColorTween(
                begin: ColorRes.color5C93FF,
                end: logic.isTween.value
                    ? ColorRes.color5C93FF
                    : ColorRes.color8A6734),
            duration: const Duration(seconds: 1),
            builder: (context, color, child) {
              return TweenAnimationBuilder<double>(
                tween: Tween<double>(
                    begin: 100.0, end: logic.isTween.value ? 200.0 : 100.0),
                duration: const Duration(seconds: 1),
                builder: (context, size, child) {
                  return Container(
                    width: size,
                    height: size,
                    color: color,
                    alignment: Alignment.center,
                    child: const Text(
                      'Hello World!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      onPressed: () {
        logic.changeTween();
      },
    );
  }

  Widget _item(String name, String className, Widget child,
      {required VoidCallback onPressed}) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: TextButton(
                onPressed: onPressed,
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16, color: ColorRes.color333333),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: child,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text('动画类：$className',
            style: const TextStyle(fontSize: 12, color: ColorRes.color999999)),
      ],
    );
  }

  @override
  void didUpdateWidget(covariant ImplicitlyAnimPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    LogUtil.log('_ImplicitlyAnimPageState.didUpdateWidget');
  }

  @override
  void dispose() {
    LogUtil.log('_ImplicitlyAnimPageState.dispose');
    Get.delete<ImplicitlyAnimLogic>();
    super.dispose();
  }
}
