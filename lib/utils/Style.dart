import 'package:flutter/material.dart';

abstract class Style {


  static const Map<int, Color> tileColor = {
    2: Colors.pink,
    4: Colors.red,
    8: Color.fromARGB(255, 242, 177, 121),
    16: Color.fromARGB(255, 245, 149, 99),
    32: Color.fromARGB(255, 246, 124, 95),
    64: Color.fromARGB(255, 246, 95, 64),
    128: Color.fromARGB(255, 235, 208, 117),
    256: Color.fromARGB(255, 237, 203, 103),
    512: Color.fromARGB(255, 236, 201, 85),
    1024: Color.fromARGB(255, 229, 194, 90),
    2048: Color.fromARGB(255, 232, 192, 70),
  };
}
