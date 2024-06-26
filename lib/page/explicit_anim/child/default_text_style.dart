import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';
import 'package:flutter_anim_example/page/explicit_anim/child/widget/child_body.dart';

class DefaultTextStylePage extends StatefulWidget {
  const DefaultTextStylePage({super.key});

  @override
  State<DefaultTextStylePage> createState() => _DefaultTextStylePageState();
}

class _DefaultTextStylePageState extends State<DefaultTextStylePage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<TextStyle> _style;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _style = TextStyleTween(
      begin: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      end: const TextStyle(
        color: Colors.blue,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.decelerate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        'DefaultTextStyleTransition',
      ),
      body: ChildBody(
        onPressed: startAnimation,
        child: animWidget(),
      ),
    );
  }

  Widget animWidget() {
    return Center(
      child: DefaultTextStyleTransition(
        style: _style,
        textAlign: TextAlign.center,
        child: const Text('Hello World!'),
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
