import 'package:flutter/material.dart';
import 'package:multiply2/HomePage.dart';


void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: '2048 Game',
      theme:  ThemeData(primarySwatch: Colors.cyan),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
