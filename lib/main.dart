import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multiply2/presentation/Game.dart';
import 'package:multiply2/utils/StringValues.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
       SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: StringValues.appName,
      debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.white),
        initialRoute: Game.routeNamed,
         routes: {
         Game.routeNamed : (BuildContext context) => const Game(),
        }
    );
  }
}
