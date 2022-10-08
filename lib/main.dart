import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multiply2/HomePage.dart';


void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return  const MaterialApp(
      title: '2048 Game',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
