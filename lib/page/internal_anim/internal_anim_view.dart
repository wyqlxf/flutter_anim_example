import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_anim_example/common/res/color.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';
import 'package:flutter_anim_example/common/widget/item_widget.dart';
import 'package:flutter_anim_example/page/base/base_page_state.dart';
import 'package:get/get.dart';

import 'internal_anim_logic.dart';

/// 预置动画，包含了以下内置常用模式： Container 变换、共享轴变化、渐变穿透和渐变变换
/// https://github.com/flutter/packages/tree/main/packages/animations
class InternalAnimPage extends StatefulWidget {
  const InternalAnimPage({super.key});

  @override
  State<InternalAnimPage> createState() => _InternalAnimPageState();
}

class _InternalAnimPageState extends BasePageState<InternalAnimPage> {
  final logic = Get.put(InternalAnimLogic());

  @override
  void onFirstFrame(Duration timeStamp) {
    super.onFirstFrame(timeStamp);
    // 减慢动画速度
    timeDilation = 5.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        '预置动画',
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorRes.colorFFFFFF,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ItemWidget('page1', () {
                logic.startPage1();
              }),
              ItemWidget('page2', () {
                logic.startPage2();
              }),
              ItemWidget('page3', () {
                logic.startPage3();
              }),
              ItemWidget('page4', () {
                logic.startPage4();
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          timeDilation = (timeDilation == 1.0) ? 5.0 : 1.0;
          if (timeDilation == 1.0) {
            Get.snackbar(
              '提示',
              '恢复正常速度',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.black.withOpacity(0.8),
              colorText: Colors.white,
            );
          } else {
            Get.snackbar(
              '提示',
              '进入慢动画',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.black.withOpacity(0.8),
              colorText: Colors.white,
            );
          }
        },
        child: const Icon(Icons.access_time),
      ),
    );
  }

  @override
  void dispose() {
    timeDilation = 1.0;
    Get.delete<InternalAnimLogic>();
    super.dispose();
  }
}
