import 'package:flutter/material.dart';

class ContainerParam {
  int id;
  Widget? child;
  double? width;
  double? height;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  AlignmentGeometry? alignment;
  Color? color;
  Decoration? decoration;

  ContainerParam({
    required this.id,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.alignment,
    this.color,
    this.decoration,
  });
}
