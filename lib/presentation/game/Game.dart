import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Game extends StatefulWidget {
  static const String routeNamed = 'GAME';
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {

  
  @override
  void initState() {
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body: Container()));
  }
}
