import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/res/color.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';
import 'package:flutter_anim_example/common/widget/item_widget.dart';
import 'package:get/get.dart';

import 'case_demo_logic.dart';

class CaseDemoPage extends StatefulWidget {
  const CaseDemoPage({super.key});

  @override
  State<CaseDemoPage> createState() => _CaseDemoPageState();
}

class _CaseDemoPageState extends State<CaseDemoPage> {
  final logic = Get.put(CaseDemoLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget('场景案例'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorRes.colorFFFFFF,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
            itemBuilder: (context, index) {
              return ItemWidget('Case${(index + 1)}', () {
                logic.startPageCase(index);
              });
            },
            itemCount: logic.pages.length),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<CaseDemoLogic>();
    super.dispose();
  }
}
