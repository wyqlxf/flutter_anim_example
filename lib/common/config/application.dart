import 'package:flutter/material.dart';

class Application {
  Application._internal();

  static final Application _instance = Application._internal();

  factory Application() {
    return _instance;
  }

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context => Application().navigatorKey.currentState!.context;
}
