import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';

/// 滚轮列表
class ListWheelPage extends StatefulWidget {
  const ListWheelPage({super.key});

  @override
  State<ListWheelPage> createState() => _ListWheelPageState();
}

class _ListWheelPageState extends State<ListWheelPage> {
  /// 滚动物理效果
  ScrollPhysics? physics;
  List<Map<String, dynamic>> physicsList = [];

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget('滚轮列表'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
        child: ListWheelScrollView(
          physics: physics,
          diameterRatio: 1.5,
          // 控制ListWheel的直径比例
          perspective: 0.005,
          // 改变视角达到3D效果
          itemExtent: 100.0,
          // 每一项的高度
          overAndUnderCenterOpacity: 0.4,
          // 中央项目相对其它项目的透明度
          children: List<Widget>.generate(20, (index) {
            return Transform.rotate(
              angle: index % 2 == 0 ? -math.pi / 4 : math.pi / 4, // 旋转角度
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.primaries[index % Colors.primaries.length],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Text(
                    'Item $index',
                    style: const TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _selectScrollPhysics();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  initData() {
    physicsList.clear();
    physicsList.add({
      'name': 'ClampingScrollPhysics',
      'physics': const ClampingScrollPhysics(),
      'desc': '在边界处限制滚动，防止内容继续滚动',
    });
    physicsList.add({
      'name': 'AlwaysScrollableScrollPhysics',
      'physics': const AlwaysScrollableScrollPhysics(),
      'desc': '始终允许滚动，即使内容不足以填满视图'
    });
    physicsList.add({
      'name': 'NeverScrollableScrollPhysics',
      'physics': const NeverScrollableScrollPhysics(),
      'desc': '禁止滚动，用户无法手动滚动内容'
    });
    physicsList.add({
      'name': 'BouncingScrollPhysics',
      'physics': const BouncingScrollPhysics(),
      'desc': '在边界处产生一个滚动的弹性效果'
    });
  }

  void _selectScrollPhysics() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            width: 200,
            height: 360,
            child: SimpleDialog(
              titlePadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              title: const Text('选择滚动物理动画'),
              children: physicsList
                  .map(
                    (map) => SimpleDialogOption(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        map['name'] + '\n' + map['desc'],
                        style: TextStyle(
                            color: physics == map['physics']
                                ? Colors.blue
                                : Colors.black),
                      ),
                      onPressed: () {
                        setState(() {
                          physics = map['physics'];
                        });
                        Navigator.pop(context);
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
