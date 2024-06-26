import 'dart:math';
import 'dart:ui';

class RandomUtil {
  static double randomBorderRadius() {
    return Random().nextDouble() * 50;
  }

  static double randomMargin() {
    return Random().nextDouble() * 50;
  }

  static double randomStart() {
    return Random().nextDouble() * 100;
  }

  static Color randomColor() {
    return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
  }

  static Offset randomOffset() {
    if (Random().nextDouble() <= 0.5) {
      return Offset(Random().nextDouble() * 1.5, Random().nextDouble());
    } else {
      return Offset(-Random().nextDouble() * 1.5, Random().nextDouble());
    }
  }
}
