import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/util/log_util.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';
import 'package:flutter_anim_example/page/explicit_anim/child/widget/child_body.dart';

class SizePage extends StatefulWidget {
  const SizePage({super.key});

  @override
  State<SizePage> createState() => _SizePageState();
}

/// If a State is used for multiple AnimationController objects,
/// or if it is passed to other objects and those objects might use it more
/// than one time in total, then instead of mixing in a SingleTickerProviderStateMixin, use a regular TickerProviderStateMixin.
class _SizePageState extends State<SizePage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _sizeFactor;

  late final AnimationController _controller2;
  late final Animation<double> _sizeFactor2;

  bool isVertical = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _sizeFactor = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );
    _controller.addListener(() {
      // 动画的每一帧都会被调用
      LogUtil.log('动画的插值 = ${_sizeFactor.value}');
    });
    _controller.addStatusListener((status) {
      // 动画开始、结束、正向或反向时回调
      switch (status) {
        case AnimationStatus.forward:
          // 动画开始
          break;
        case AnimationStatus.completed:
          // 动画完成
          break;
        case AnimationStatus.reverse:
          // 动画开始(倒放)
          break;
        case AnimationStatus.dismissed:
          // 动画完成(回到起始位置)
          setState(() {
            isVertical = !isVertical;
          });
          break;
      }
      LogUtil.log('动画的状态 = $status');
    });

    // 通常情况下，只需要一个动画控制器，这里只是为了示范TickerProviderStateMixin和SingleTickerProviderStateMixin的区别
    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _sizeFactor2 = CurvedAnimation(
      parent: _controller2,
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        'SizeTransition',
      ),
      body: ChildBody(
        onPressed: startAnimation,
        child: animWidget(),
      ),
    );
  }

  Widget animWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizeTransition(
          sizeFactor: _sizeFactor,
          axis: isVertical ? Axis.vertical : Axis.horizontal,
          axisAlignment: -1,
          child: Container(
            width: 128,
            height: 128,
            color: Colors.blue,
            margin: const EdgeInsets.symmetric(horizontal: 20),
          ),
        ),
        const SizedBox(height: 16),
        SizeTransition(
          sizeFactor: _sizeFactor2,
          axis: isVertical ? Axis.vertical : Axis.horizontal,
          axisAlignment: -1,
          child: Container(
            width: 128,
            height: 128,
            color: Colors.orange,
            margin: const EdgeInsets.symmetric(horizontal: 20),
          ),
        ),
      ],
    );
  }

  startAnimation() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }

    if (_controller2.isCompleted) {
      _controller2.reverse();
    } else {
      _controller2.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }
}
