import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/res/color.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';

class OtherView extends StatelessWidget {
  const OtherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget('其他页面'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorRes.colorFFFFFF,
        alignment: Alignment.center,
        child: const Text(
          'Hello OtherView!',
          style: TextStyle(fontSize: 24, color: ColorRes.color333333),
        ),
      ),
    );
  }
}
