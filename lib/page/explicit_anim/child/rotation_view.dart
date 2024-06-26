import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';
import 'package:flutter_anim_example/page/explicit_anim/child/widget/child_body.dart';

class RotationPage extends StatefulWidget {
  const RotationPage({super.key});

  @override
  State<RotationPage> createState() => _RotationPageState();
}

class _RotationPageState extends State<RotationPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> turns;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    turns = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        'RotationTransition',
      ),
      body: ChildBody(
        onPressed: startAnimation,
        child: animWidget(),
      ),
    );
  }

  Widget animWidget() {
    return Center(
      child: RotationTransition(
        turns: turns,
        child: Container(
          width: 128,
          height: 128,
          color: Colors.blue,
        ),
      ),
    );
  }

  startAnimation() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
