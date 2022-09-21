

import 'package:flutter/material.dart';
import 'package:multiply2/utils/Global.dart';

class BigButton extends StatelessWidget {
  final String label;
  final Color color;
  final void Function() onPressed;

  const BigButton(
      {Key? key,
      required this.label,
      required this.color,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      height: 80,
      width: 400,
      child: RaisedButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        onPressed: onPressed,
        child: Text(label,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.w700)),
      ));
}

