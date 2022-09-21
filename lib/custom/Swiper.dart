
import 'package:flutter/material.dart';

class Swiper extends StatelessWidget {
  final Function() up;
  final Function() down;
  final Function() left;
  final Function() right;
  final Widget child;

  const Swiper(
      {Key? key,
      required this.up,
      required this.down,
      required this.left,
      required this.right,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.velocity.pixelsPerSecond.dy < -250) {
          up();
        } else if (details.velocity.pixelsPerSecond.dy > 250) {
          down();
        }
      },
      onHorizontalDragEnd: (details) {
        if (details.velocity.pixelsPerSecond.dx < -1000) {
          left();
        } else if (details.velocity.pixelsPerSecond.dx > 1000) {
          right();
        }
      },
      child: child);
}
