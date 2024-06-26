import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/route/route.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';
import 'package:flutter_anim_example/common/widget/item_widget.dart';
import 'package:flutter_anim_example/page/implicitly_anim/child/widget/circular_progress.dart';
import 'package:flutter_anim_example/page/implicitly_anim/child/widget/cuprtino_activity.dart';
import 'package:flutter_anim_example/page/implicitly_anim/child/widget/expand_icon.dart';
import 'package:flutter_anim_example/page/implicitly_anim/child/widget/expansion_panel.dart';
import 'package:flutter_anim_example/page/implicitly_anim/child/widget/expansion_tile.dart';
import 'package:flutter_anim_example/page/implicitly_anim/child/widget/linear_progress.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        '更多',
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ItemWidget('CircularProgressIndicator', () {
                RouteMgr.pushPage(const CircularProgressPage());
              }),
              ItemWidget('LinearProgressIndicator', () {
                RouteMgr.pushPage(const LinearProgressPage());
              }),
              ItemWidget('CupertinoActivityIndicator', () {
                RouteMgr.pushPage(const CupertinoActivityPage());
              }),
              ItemWidget('ExpandIcon', () {
                RouteMgr.pushPage(const ExpandIconPage());
              }),
              ItemWidget('ExpansionTile', () {
                RouteMgr.pushPage(const ExpansionTilePage());
              }),
              ItemWidget('ExpansionPanelList', () {
                RouteMgr.pushPage(const ExpansionPanelListPage());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
