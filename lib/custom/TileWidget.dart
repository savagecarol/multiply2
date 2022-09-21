import 'package:flutter/material.dart';
import 'package:multiply2/utils/Global.dart';

class TileWidget extends StatelessWidget {
  final double x;
  final double y;
  final double containerSize;
  final double size;
  final Color color;
  final Widget child;
  const TileWidget(
      {Key? key,
      required this.x,
      required this.y,
      required this.containerSize,
      required this.size,
      required this.color,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Positioned(
      left: x,
      top: y,
      child: Container(
          width: containerSize,
          height: containerSize,
          child: Center(
              child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(cornerRadius),
                      color: color),
                  child: child))));
}
