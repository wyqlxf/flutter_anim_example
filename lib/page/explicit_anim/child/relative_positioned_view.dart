import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';
import 'package:flutter_anim_example/page/explicit_anim/child/widget/child_body.dart';

class RelativePositionedPage extends StatefulWidget {
  const RelativePositionedPage({super.key});

  @override
  State<RelativePositionedPage> createState() => _RelativePositionedPageState();
}

class _RelativePositionedPageState extends State<RelativePositionedPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        'RelativePositionedTransition',
      ),
      body: ChildBody(
        onPressed: startAnimation,
        child: animWidget(),
      ),
    );
  }

  Widget animWidget() {
    // RelativePositionedTransition是Stack的一个子组件，它使用相对定位来控制子组件的位置
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        const double iconSize = 100;
        final Size biggest = constraints.biggest;
        Rect begin = Rect.fromLTWH((biggest.width - iconSize) / 2,
            biggest.height - iconSize, iconSize, iconSize);
        Rect end = Rect.fromLTWH(
            (biggest.width - iconSize) / 2, 0, iconSize, iconSize);
        return Stack(
          children: <Widget>[
            RelativePositionedTransition(
              size: biggest,
              rect: RectTween(
                begin: begin,
                end: end,
              ).animate(CurvedAnimation(
                parent: _controller,
                curve: Curves.elasticInOut,
              )),
              child: const Icon(
                Icons.airplanemode_on,
                size: iconSize,
                color: Colors.blue,
              ),
            ),
          ],
        );
      },
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
