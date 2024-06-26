import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/res/color.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';
import 'package:flutter_anim_example/common/widget/item_widget.dart';
import 'package:flutter_anim_example/page/base/base_page_state.dart';
import 'package:get/get.dart';

import 'transition_anim_logic.dart';

/// 页面转场动画
class TransitionAnimPage extends StatefulWidget {
  const TransitionAnimPage({super.key});

  @override
  State<TransitionAnimPage> createState() => _TransitionAnimPageState();
}

class _TransitionAnimPageState extends BasePageState<TransitionAnimPage> {
  final logic = Get.put(TransitionAnimLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget('页面转场动画'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorRes.colorFFFFFF,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ItemWidget('上下平移', () {
                logic.startPagePanUpDown();
              }),
              ItemWidget('左右平移', () {
                logic.startPagePanLeftRight();
              }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<TransitionAnimLogic>();
    super.dispose();
  }
}
