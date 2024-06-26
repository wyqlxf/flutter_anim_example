/// 数值获取工具类
class ObtainValueUtil {
  /// 获取map数据
  static Map getMap(Map? map, String? key) {
    if (null != map && null != key && map.containsKey(key)) {
      if (map[key] is Map) {
        return map[key];
      }
    }
    return {};
  }

  /// 获取List数据
  static List getList(Map? map, String? key) {
    List list = [];
    if (null != map && null != key && map.containsKey(key)) {
      if (map[key] is List) {
        list = map[key];
      }
    }
    return list;
  }

  /// 获取map数据
  static Map<String, String> getStringMap(Map? map, String? key,
      {Map<String, String> defaultValue = const {}}) {
    if (null != map && null != key && map.containsKey(key)) {
      if (map[key] is Map<String, String>) {
        return map[key];
      }
    }
    return defaultValue;
  }

  /// 获取map数据
  static Map<String, dynamic> getDynamicMap(Map? map, String? key,
      {Map<String, dynamic> defaultValue = const {}}) {
    if (null != map && null != key && map.containsKey(key)) {
      if (map[key] is Map<String, dynamic>) {
        return map[key];
      }
    }
    return defaultValue;
  }

  /// 获取List数据
  static List<String> getStringList(Map? map, String? key) {
    List<String> list = [];
    if (null != map && null != key && map.containsKey(key)) {
      if (map[key] is List<String>) {
        list = map[key];
      } else {
        for (var value in map[key]) {
          list.add('$value');
        }
      }
    }
    return list;
  }

  /// 获取数值（最终转化为字符串类型）
  static String getString(Map? map, String? key, {String defaultValue = ''}) {
    String value = defaultValue;
    if (null != map && null != key && map.containsKey(key)) {
      value = (map[key]).toString();
      if (value.isEmpty) {
        value = defaultValue;
      }
    }
    return value.replaceAll('null', '');
  }

  /// 获取数值（最终转化为字符串类型）
  static String getStringFromDynamic(dynamic? d, String? key,
      {String defaultValue = ''}) {
    String value = defaultValue;
    if (null != d && null != key) {
      value = d[key].toString();
      if (value.isEmpty) {
        value = defaultValue;
      }
    }
    return value.replaceAll('null', '');
  }

  /// 获取数值（布尔型）
  static bool getBool(Map? map, String? key, {bool defaultValue = false}) {
    bool flag = defaultValue;
    if (null != map && null != key && map.containsKey(key)) {
      var value = (map[key]);
      if (value is bool) {
        flag = value;
      }
    }
    return flag;
  }

  /// 获取map数据
  static Map getMapFromList(List? list, int position) {
    Map map = {};
    if (null != list && position >= 0 && position < list.length) {
      map = list[position];
    }
    return map;
  }

  /// 获取map中集合数据中的首个元素
  static String getStringFromListFirst(
      Map<String, List<String>>? map, String key) {
    if (null != map) {
      return '${map[key]?.first}';
    }
    return '';
  }

  /// 获取数值（最终转化为字符串类型）
  static String getStringFromList(List? list, int index) {
    String value = '';
    if (null != list && list.length > index && index >= 0) {
      value = (list[index]).toString();
    }
    return value.replaceAll('null', '');
  }

  /// 获取数值
  static int getInt(Map? map, String? key, {int defaultValue = 0}) {
    int value = defaultValue;
    if (null != map && null != key && map.containsKey(key)) {
      if (map[key] is int) {
        value = map[key];
      }
    }
    return value;
  }

  /// 获取数值
  static double getDouble(Map? map, String? key, {double defaultValue = 0}) {
    double value = defaultValue;
    if (null != map && null != key && map.containsKey(key)) {
      if (map[key] is double) {
        value = map[key];
      } else if (map[key] is String) {
        value = double.tryParse(map[key]) ?? defaultValue;
      }
    }
    return value;
  }

  static getObject(Map? map, String? key) {
    if (null != map && null != key && map.containsKey(key)) {
      return map[key];
    }
    return null;
  }
}
