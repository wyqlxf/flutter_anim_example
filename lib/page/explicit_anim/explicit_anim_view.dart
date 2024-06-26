import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/res/color.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';
import 'package:flutter_anim_example/common/widget/item_widget.dart';
import 'package:flutter_anim_example/page/base/base_page_state.dart';
import 'package:get/get.dart';

import 'explicit_anim_logic.dart';

/// 显示动画页面（动画效果需要开发者手动管理动画控制器等细节）
class ExplicitAnimPage extends StatefulWidget {
  const ExplicitAnimPage({super.key});

  @override
  State<ExplicitAnimPage> createState() => _ExplicitAnimPageState();
}

class _ExplicitAnimPageState extends BasePageState<ExplicitAnimPage> {
  final logic = Get.put(ExplicitAnimLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        '显示动画',
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorRes.colorFFFFFF,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ItemWidget('SizeTransition', () {
                logic.startPageSize();
              }),
              ItemWidget('FadeTransition', () {
                logic.startPageFade();
              }),
              ItemWidget('AlignTransition', () {
                logic.startPageAlign();
              }),
              ItemWidget('ScaleTransition', () {
                logic.startPageScale();
              }),
              ItemWidget('SlideTransition', () {
                logic.startPageSlide();
              }),
              ItemWidget('RotationTransition', () {
                logic.startPageRotation();
              }),
              ItemWidget('DecoratedBoxTransition', () {
                logic.startPageDecoratedBox();
              }),
              ItemWidget('DefaultTextStyleTransition', () {
                logic.startPageDefaultTextStyle();
              }),
              ItemWidget('PositionedTransition', () {
                logic.startPagePositioned();
              }),
              ItemWidget('RelativePositionedTransition', () {
                logic.startPageRelativePositioned();
              }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<ExplicitAnimLogic>();
    super.dispose();
  }
}
