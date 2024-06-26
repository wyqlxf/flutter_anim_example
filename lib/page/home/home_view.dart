import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/res/color.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logic = Get.put(HomePageLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget('动画示例'),
      body: GetBuilder<HomePageLogic>(
        builder: (logic) {
          return body();
        },
      ),
    );
  }

  Widget body() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorRes.colorFFFFFF,
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2),
        itemCount: logic.data.length,
        itemBuilder: (BuildContext ctx, index) {
          return GestureDetector(
            onTap: () {
              logic.clickItem(logic.data[index]['id']);
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: ColorRes.colorF5F5F5,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                logic.data[index]['name'],
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: ColorRes.color333333),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<HomePageLogic>();
    super.dispose();
  }
}
