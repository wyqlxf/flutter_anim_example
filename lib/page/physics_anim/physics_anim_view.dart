import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/res/color.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';
import 'package:flutter_anim_example/common/widget/item_widget.dart';
import 'package:get/get.dart';

import 'physics_anim_logic.dart';

/// 物理动画
class PhysicsAnimPage extends StatefulWidget {
  const PhysicsAnimPage({super.key});

  @override
  State<PhysicsAnimPage> createState() => _PhysicsAnimPageState();
}

class _PhysicsAnimPageState extends State<PhysicsAnimPage> {
  final logic = Get.put(PhysicsAnimLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        '物理动画',
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorRes.colorFFFFFF,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ItemWidget('弹簧', () {
                logic.startPageSpring();
              }),
              ItemWidget('列表', () {
                logic.startPageListView();
              }),
              ItemWidget('滚轮列表', () {
                logic.startPageListWheelView();
              }),
              ItemWidget('网格列表', () {
                logic.startPageGridView();
              }),
              ItemWidget('页面视图', () {
                logic.startPagePageView();
              }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<PhysicsAnimLogic>();
    super.dispose();
  }
}
