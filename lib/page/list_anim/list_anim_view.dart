import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/res/color.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';
import 'package:get/get.dart';

import 'list_anim_logic.dart';

class ListAnimPage extends StatefulWidget {
  const ListAnimPage({super.key});

  @override
  State<ListAnimPage> createState() => _ListAnimPageState();
}

class _ListAnimPageState extends State<ListAnimPage> {
  final logic = Get.put(ListAnimLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget('列表动画'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorRes.colorFFFFFF,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            AnimatedList(
              key: logic.listKey,
              initialItemCount: logic.listData.length,
              itemBuilder: (context, index, animation) {
                return buildItem(context, index, animation);
              },
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      logic.insert();
                    },
                    child: const Text('+'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      logic.remove();
                    },
                    child: const Text('-'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        color: logic.selectIndex == index ? Colors.blue[300] : null,
        child: ListTile(
          title: Text(logic.listData[index]),
          onTap: () {
            setState(() {
              logic.selectIndex = index;
            });
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<ListAnimLogic>();
    super.dispose();
  }
}
