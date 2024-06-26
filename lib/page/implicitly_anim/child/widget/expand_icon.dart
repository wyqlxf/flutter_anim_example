import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';

class ExpandIconPage extends StatefulWidget {
  const ExpandIconPage({super.key});

  @override
  State<ExpandIconPage> createState() => _ExpandIconPageState();
}

class _ExpandIconPageState extends State<ExpandIconPage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        'ExpandIcon',
      ),
      body: body(),
    );
  }

  Widget body() {
    return Center(
      child: ExpandIcon(
        isExpanded: _isExpanded,
        color: Colors.black,
        expandedColor: Colors.blueAccent,
        size: 60,
        padding: const EdgeInsets.all(20),
        onPressed: (bool isExpanded) {
          setState(() {
            _isExpanded = !isExpanded;
          });
        },
      ),
    );
  }
}
