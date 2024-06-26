import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListAnimLogic extends GetxController {
  int? selectIndex;

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  List<String> listData = List.generate(3, (index) => 'Item $index');

  insert() {
    final int index = selectIndex != null ? selectIndex! : listData.length;
    listData.insert(index, 'Item ${listData.length}');
    listKey.currentState!.insertItem(index);
  }

  remove() {
    final int index = selectIndex != null ? selectIndex! : listData.length - 1;
    if (index < 0) return;
    final String text = listData[index];
    listKey.currentState!.removeItem(
      index,
      (context, animation) => SizeTransition(
        sizeFactor: animation,
        child: Card(
          color: selectIndex == index ? Colors.blue[300] : null,
          child: ListTile(
            title: Text(text),
          ),
        ),
      ),
    );
    listData.removeAt(index);
    selectIndex = null;
  }
}
