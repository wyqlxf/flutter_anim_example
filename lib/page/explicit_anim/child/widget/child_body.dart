import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/res/color.dart';

const colDivider = Divider(
  indent: 16,
  endIndent: 16,
  height: 32,
  thickness: 1,
  color: ColorRes.colorE5E5E5,
);

class ChildBody extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const ChildBody({
    super.key,
    required this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorRes.colorFFFFFF,
      child: Column(
        children: [
          Expanded(
            child: child,
          ),
          colDivider,
          ElevatedButton(
            onPressed: onPressed,
            child: const Padding(
                padding: EdgeInsets.all(12), child: Text('Start Animation')),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
