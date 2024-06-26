import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/res/color.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';
import 'package:flutter_anim_example/page/explicit_anim/child/widget/child_body.dart';

class DecoratedBoxPage extends StatefulWidget {
  const DecoratedBoxPage({super.key});

  @override
  State<DecoratedBoxPage> createState() => _DecoratedBoxPageState();
}

class _DecoratedBoxPageState extends State<DecoratedBoxPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Decoration> _decoration;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    final DecorationTween decorationTween = DecorationTween(
      begin: BoxDecoration(
        color: ColorRes.colorFFFFFF,
        borderRadius: BorderRadius.circular(64.0),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: ColorRes.color3072f6,
            blurRadius: 8.0,
            spreadRadius: 2.0,
            offset: Offset(0, 4.0),
          ),
        ],
      ),
      end: BoxDecoration(
        color: ColorRes.colorFFFFFF,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: ColorRes.color3072f6,
            blurRadius: 8.0,
            spreadRadius: 2.0,
            offset: Offset(0, 4.0),
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
        // No shadow.
      ),
    );
    _decoration = decorationTween.animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        'DecoratedBoxTransition',
      ),
      body: ChildBody(
        onPressed: startAnimation,
        child: animWidget(),
      ),
    );
  }

  Widget animWidget() {
    return Center(
      child: DecoratedBoxTransition(
        decoration: _decoration,
        position: DecorationPosition.background,
        child: const Icon(
          Icons.add_circle,
          size: 128,
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
