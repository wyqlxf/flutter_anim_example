import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';
import 'package:flutter_anim_example/page/physics_anim/physics/custom_scroll_physics.dart';

/// 列表
class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  /// 滚动物理效果
  ScrollPhysics? physics;
  List<Map<String, dynamic>> physicsList = [];
  List<String> _list = List.generate(10, (index) => 'Item $index');
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    initData();
    _controller.addListener(() {
      if (_list.length < 100 &&
          _controller.position.pixels == _controller.position.maxScrollExtent) {
        _list.addAll(
            List.generate(10, (index) => 'Item ${_list.length + index}'));
        setState(() {});
      }
      if (kDebugMode) {
        print('pixels: ${_controller.position.pixels}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('列表', actions: [
        IconButton(
          onPressed: () {
            setState(() {
              _list = List.generate(
                  _list.length == 10 ? 20 : 10, (index) => 'Item $index');
            });
          },
          icon: const Icon(Icons.refresh),
        ),
      ]),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: ListView.builder(
          controller: _controller,
          itemCount: _list.length,
          physics: physics,
          itemExtent: 50,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_list[index]),
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
    physicsList.add({
      'name': 'CustomScrollPhysics',
      'physics': const CustomScrollPhysics(),
      'desc': '自定义滚动物理效果'
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
