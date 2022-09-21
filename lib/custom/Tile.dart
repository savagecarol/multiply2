import 'package:flutter/material.dart';
import 'package:multiply2/utils/Global.dart';

class Tile {
  final int x;
  final int y;
  int value;
  late Animation<double> animatedX;
  late Animation<double> animatedY;
  late Animation<double> size;
  late Animation<int> animatedValue;

  Tile(this.x, this.y, this.value) {
    resetAnimations();
  }

  void resetAnimations() {
    animatedX = AlwaysStoppedAnimation(x.toDouble());
    animatedY = AlwaysStoppedAnimation(y.toDouble());
    size = AlwaysStoppedAnimation(1.0);
    animatedValue = AlwaysStoppedAnimation(value);
  }
}
