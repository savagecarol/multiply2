import 'dart:io';
import 'package:flutter/material.dart';
import 'package:multiply2/utils/StringValues.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';

class Game extends StatefulWidget {
  static const String routeNamed = 'GAME';
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  bool _isLoading = false;
  Image? _image;
  GlobalKey previewContainer = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double gridWidth = (width - 80) / 4;
    double gridHeight = gridWidth;
    double height = 30 + (gridHeight * 4) + 10;

    return SafeArea(
      child: RepaintBoundary(
        key: previewContainer,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              StringValues.appName,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.teal,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                _isLoading = true;
              });
              Future.delayed(Duration(seconds: 5), () {
                ShareFilesAndScreenshotWidgets().shareScreenshot(
                    previewContainer,
                    MediaQuery.of(context).size.height.toInt(),
                    "Title",
                    "Name.png",
                    "image/png",
                    text: "This is the caption!");
              });
              setState(() {
                _isLoading = false;
              });
            },
            tooltip: 'Increment',
            child: _isLoading
                ? const CircularProgressIndicator()
                : const Icon(Icons.share),
          ),
        ),
      ),
    );
  }
}
