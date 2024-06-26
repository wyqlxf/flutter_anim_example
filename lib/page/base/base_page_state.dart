import 'package:flutter/material.dart';

abstract class BasePageState<T extends StatefulWidget> extends State<T> {
  void onFirstFrame(Duration timeStamp) {}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onFirstFrame(timeStamp);
    });
  }

  updateUI({VoidCallback? callback}) {
    if (mounted) {
      setState(callback ?? () {});
    }
  }
}
