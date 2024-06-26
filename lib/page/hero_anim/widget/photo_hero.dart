import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget {
  final double width;
  final String tag;
  final VoidCallback? onTap;
  final Color? color;

  const PhotoHero({
    super.key,
    required this.width,
    required this.tag,
    this.color = Colors.blue,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: double.infinity,
      child: Hero(
        tag: tag,
        flightShuttleBuilder:
            (context, animation, direction, fromContext, toContext) {
          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Icon(
                Icons.photo,
                size: animation.value * width,
                color: color,
              );
            },
          );
        },
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Icon(Icons.photo, size: width, color: color),
          ),
        ),
      ),
    );
  }
}
