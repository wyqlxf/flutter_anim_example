import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/res/color.dart';

class ItemWidget extends StatelessWidget {
  final String name;
  final GestureTapCallback onTap;

  const ItemWidget(this.name, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorRes.colorF5F5F5,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          name,
          style: const TextStyle(fontSize: 18, color: ColorRes.color333333),
        ),
      ),
    );
  }
}
