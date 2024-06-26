import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/res/color.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';
import 'package:flutter_anim_example/page/base/base_page_state.dart';
import 'package:get/get.dart';

import 'staggered_anim_logic.dart';

/// 交织动画(交错动画)页面
class StaggeredAnimPage extends StatefulWidget {
  const StaggeredAnimPage({super.key});

  @override
  State<StaggeredAnimPage> createState() => _StaggeredAnimPageState();
}

class _StaggeredAnimPageState extends BasePageState<StaggeredAnimPage>
    with SingleTickerProviderStateMixin {
  final logic = Get.put(StaggeredAnimLogic());

  @override
  initState() {
    super.initState();
    logic.init(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        '交织动画',
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorRes.colorFFFFFF,
        child: Column(
          children: <Widget>[
            Expanded(child: _buildAnimated()),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                logic.startAnimation();
              },
              child: const Text('Start Animation'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimated() {
    return ListView(
      children: List.generate(
        10,
        (index) {
          return AnimatedBuilder(
            animation: logic.controller,
            builder: (context, child) {
              return Opacity(
                opacity: logic.animations[index].value,
                child: Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  height: 48,
                  color: Colors.blue[200],
                  alignment: Alignment.center,
                  child: Text(
                    'Item $index',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<StaggeredAnimLogic>();
    super.dispose();
  }
}
