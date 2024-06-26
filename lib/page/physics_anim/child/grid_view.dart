import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';

/// 网格列表
class GridPage extends StatefulWidget {
  const GridPage({super.key});

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
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
      appBar: const AppBarWidget('网格列表'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          physics: physics,
          itemCount: 99,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0),
              child: Text('Item $index'),
            );
          },
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
