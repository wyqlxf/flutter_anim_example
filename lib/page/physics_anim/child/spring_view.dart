import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';

/// 弹簧
class SpringPage extends StatefulWidget {
  const SpringPage({super.key});

  @override
  State<SpringPage> createState() => _SpringPageState();
}

class _SpringPageState extends State<SpringPage>
    with SingleTickerProviderStateMixin {
  /// 动画控制器
  late final AnimationController _controller;

  /// 定义一个新的对齐动画
  late Animation<Alignment> _animation;

  /// left: -1, right: 1, top: -1, bottom: 1, center: 0
  var _dragAlignment = Alignment.center;

  /// 是否垂直方向
  bool isVertical = true;

  /// 动画是否正在运行
  bool running = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this)
      ..addListener(() {
        setState(() {
          _dragAlignment = _animation.value;
        });
      });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 动画完成
        setState(() {
          isVertical = !isVertical;
          running = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget('弹簧'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
                child: Align(
              alignment: _dragAlignment,
              child: SizedBox(
                width: 120,
                height: 120,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    for (int i = 0; i < 12; i++)
                      Transform.rotate(
                        angle: i * 30 * 0.0174533,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 80,
                            height: 10,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    Container(
                      width: 110,
                      height: 110,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            )),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
                startAnimation();
              },
              child: const Text('Start Animation'),
            ),
            const SizedBox(height: 24)
          ],
        ),
      ),
    );
  }

  /// 开始动画
  void startAnimation() {
    if (running) {
      return;
    }
    running = true;
    // 用于创建一个从begin到end的动画
    if (isVertical) {
      _animation = _controller.drive(
        AlignmentTween(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );
    } else {
      _animation = _controller.drive(
        AlignmentTween(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      );
    }
    // 定义一个弹簧的物理特性，mass：质量，stiffness：刚度，damping：阻尼
    const spring = SpringDescription(
        mass: 10, // 值越大动画的质量越稳定，但是速度越慢，其值通常为正数，但没有严格的上限
        stiffness: 800, // 其值通常为正数，刚度越大弹性越强
        damping: 0.2 // 其值通常为正数，阻尼越大震荡越快平息
        );
    // SpringSimulation： 基于弹簧物理模拟的动画的类
    // spring：弹簧的物理特性，start：动画开始位置，end：动画结束位置，velocity：动画的初始速度
    final simulation = SpringSimulation(spring, 0, 0.5, 0);
    _controller.animateWith(simulation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
