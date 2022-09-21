
import 'package:flutter/material.dart';

class TileNumber extends StatelessWidget {
  final int val;

  const TileNumber(this.val, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text("$val",
      style: TextStyle(
          color: Colors.white,
          fontSize: val > 512 ? 28 : 35,
          fontWeight: FontWeight.w900));
}
