import 'package:flutter/foundation.dart';

/// 日志工具类
class LogUtil {
  static const bool _isPrint = true;

  /// 最大长度
  static const int _logMaxLength = 540;

  /// 自定义日志标签
  static const String _tag = '【Anim日志】💚 ';

  static log(String string, {bool isPrint = true}) {
    _log(_tag, string, isPrint: isPrint);
  }

  static _log(String tag, String string, {bool isPrint = true}) {
    if (_isPrint) {
      if (isPrint) {
        if (kDebugMode) {
          string = tag + string;
          if (string.length <= _logMaxLength) {
            print(string);
          } else {
            int count = (string.length / _logMaxLength).ceil();
            for (var index = 0; index < count; index++) {
              var start = index * _logMaxLength;
              var end = (index + 1) * _logMaxLength;
              String result;
              if (end < string.length) {
                result = string.substring(start, end);
              } else {
                result = string.substring(start);
              }
              print(result);
            }
          }
        }
      }
    }
  }
}
