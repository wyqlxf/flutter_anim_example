import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/res/color.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';
import 'package:get/get.dart';

import 'tween_anim_logic.dart';

/// 补间动画页面
class TweenAnimPage extends StatefulWidget {
  const TweenAnimPage({super.key});

  @override
  State<TweenAnimPage> createState() => _TweenAnimPageState();
}

class _TweenAnimPageState extends State<TweenAnimPage>
    with TickerProviderStateMixin {
  final logic = Get.put(TweenAnimLogic());

  @override
  void initState() {
    super.initState();
    logic.init(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget('补间动画'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorRes.colorFFFFFF,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: <Widget>[
            _buildDescriptionText(),
            _buildDivider(),
            _buildAnimatedWidget(0),
            _buildDivider(),
            _buildAnimatedWidget(1),
            _buildDivider(),
            _buildAnimatedWidget(2),
            _buildDivider(),
            _buildAnimatedWidget(3),
            _buildDivider(),
            _buildFlipWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionText() {
    return const Text('补间动画在两个关键帧之间创建平滑的过渡动画，下面使用Animation和Tween类来实现补间动画');
  }

  Widget _buildDivider() {
    return const Divider(
      height: 32,
      thickness: 1,
      color: ColorRes.colorE5E5E5,
    );
  }

  Widget _buildAnimatedWidget(int index) {
    return GestureDetector(
      onTap: () {
        logic.startAnimation(index);
      },
      child: AnimatedBuilder(
        animation: logic.animations[index],
        builder: (context, child) {
          if (index == 0) {
            return _buildRotateWidget(
                logic.animations[index], Icons.refresh, Colors.blue);
          } else if (index == 1) {
            return _buildTranslateWidget(
                logic.animations[index], Icons.accessibility, Colors.orange);
          } else if (index == 2) {
            return _buildScaleWidget(
                logic.animations[index], Icons.favorite, Colors.red);
          } else if (index == 3) {
            return _buildIconWidget(
                logic.animations[index], Icons.star, Colors.yellow);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildRotateWidget(
      Animation<double> animation, IconData icon, Color color) {
    return Transform.rotate(
      angle: animation.value,
      child: Icon(
        icon,
        color: color,
        size: 80,
      ),
    );
  }

  Widget _buildTranslateWidget(
      Animation<double> animation, IconData icon, Color color) {
    return Transform.translate(
      offset: Offset(animation.value, 0),
      child: Icon(
        icon,
        color: color,
        size: 80,
      ),
    );
  }

  Widget _buildScaleWidget(
      Animation<double> animation, IconData icon, Color color) {
    return Transform.scale(
      scale: animation.value,
      child: Icon(
        icon,
        color: color,
        size: 80,
      ),
    );
  }

  Widget _buildIconWidget(
      Animation<double> animation, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        logic.startAnimation(3);
      },
      child: Icon(
        icon,
        color: color,
        size: animation.value,
      ),
    );
  }

  Widget _buildFlipWidget() {
    return GetBuilder<TweenAnimLogic>(
      id: 'flip',
      builder: (logic) {
        return GestureDetector(
          onTap: () {
            logic.flip();
          },
          child: Transform.flip(
            flipX: logic.isFlipX,
            flipY: logic.isFlipY,
            child: const Icon(
              Icons.flip,
              color: Colors.green,
              size: 80,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    Get.delete<TweenAnimLogic>();
    super.dispose();
  }
}
