import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';

class LinearProgressPage extends StatefulWidget {
  const LinearProgressPage({super.key});

  @override
  State<LinearProgressPage> createState() => _LinearProgressPageState();
}

class _LinearProgressPageState extends State<LinearProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        'LinearProgressIndicator',
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.all(24),
      alignment: Alignment.center,
      child: SizedBox(
        width: double.infinity,
        height: 6,
        child: LinearProgressIndicator(
          value: null,
          backgroundColor: Colors.grey,
          borderRadius: BorderRadius.circular(3),
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
        ),
      ),
    );
  }
}
