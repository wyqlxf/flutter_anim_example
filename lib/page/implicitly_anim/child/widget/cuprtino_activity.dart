import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';

class CupertinoActivityPage extends StatefulWidget {
  const CupertinoActivityPage({super.key});

  @override
  State<CupertinoActivityPage> createState() => _CupertinoActivityPageState();
}

class _CupertinoActivityPageState extends State<CupertinoActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        'CupertinoActivityIndicator',
      ),
      body: body(),
    );
  }

  Widget body() {
    return const Center(
      child: SizedBox(
        width: 60,
        height: 60,
        child: CupertinoActivityIndicator(
          radius: 50,
          color: Colors.blueAccent,
          animating: true,
        ),
      ),
    );
  }
}
