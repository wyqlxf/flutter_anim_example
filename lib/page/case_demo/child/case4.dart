import 'dart:math';

import 'package:flutter/material.dart';

class Case4 extends StatefulWidget {
  const Case4({super.key});

  @override
  Case4State createState() => Case4State();
}

class Case4State extends State<Case4> {
  int _targetNumber = 7329486;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Case4'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: Colors.white,
        child: NumberScrollAnimation(targetNumber: _targetNumber),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Random random = Random();
            // 生成第一个数字（从1到9）
            int firstDigit = random.nextInt(9) + 1;
            // 生成剩余的六个数字（从0到9）
            int remainingDigits = random.nextInt(1000000);
            // 拼接成一个七位数，不足的地方用0补齐
            String sevenDigitNumber =
                '$firstDigit${remainingDigits.toString().padRight(6, '0')}';
            _targetNumber = int.tryParse(sevenDigitNumber) ?? 0;
          });
        },
        child: const Icon(Icons.play_circle),
      ),
    );
  }
}

class NumberScrollAnimation extends StatelessWidget {
  final int targetNumber;

  const NumberScrollAnimation({super.key, required this.targetNumber});

  @override
  Widget build(BuildContext context) {
    List<String> digits = targetNumber.toString().split('');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: digits
          .map((digit) => AnimatedDigit(targetDigit: int.parse(digit)))
          .toList(),
    );
  }
}

class AnimatedDigit extends StatefulWidget {
  final int targetDigit;

  const AnimatedDigit({super.key, required this.targetDigit});

  @override
  AnimatedDigitState createState() => AnimatedDigitState();
}

class AnimatedDigitState extends State<AnimatedDigit> {
  final FixedExtentScrollController _controller = FixedExtentScrollController();

  @override
  void initState() {
    super.initState();
    _animateToTargetDigit();
  }

  void _animateToTargetDigit() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _controller.animateToItem(
        widget.targetDigit,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void didUpdateWidget(AnimatedDigit oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animateToTargetDigit();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: ListWheelScrollView.useDelegate(
        controller: _controller,
        itemExtent: 50,
        perspective: 0.005,
        physics: const NeverScrollableScrollPhysics(),
        childDelegate: ListWheelChildLoopingListDelegate(
          children: List<Widget>.generate(
            10,
            (index) => Center(
              child: Text(
                '$index',
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
