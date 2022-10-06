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
            backgroundColor: StringValues.appColor,
          ),
          bottomNavigationBar:    Padding(
            padding: const EdgeInsets.only(top: 0 , left: 32 , right: 32 , bottom: 32),
            child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FloatingActionButton(
              backgroundColor: StringValues.appColor,
              onPressed: ()  {},
              tooltip: 'Increment',
              child:  const Icon(Icons.restart_alt_outlined),
            ),
                FloatingActionButton(
              backgroundColor: StringValues.appColor,
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                await Future.delayed(const Duration(seconds: 2), () {
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
                  ? const SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : const Icon(Icons.share),
            ),
                        ],
                      ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                        Container(
                          width: 130,
                        decoration: const BoxDecoration(
                                color: StringValues.appColor,
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: const [
                              Text(StringValues.score  , style: TextStyle(color: Colors.white ,  fontWeight: FontWeight.bold , fontSize: 16)) , 
                              SizedBox(height : 8),
                              Text("200"  , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold)) , 
                            ],
                          ),
                        ),
                      ),

                        Container(
                           width: 130,
                        decoration: const BoxDecoration(
                                color: StringValues.appColor,
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: const [
                              Text(StringValues.highScore  , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 16)) ,
                              SizedBox(height : 8),
                              Text("200"  , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold)) , 
                            ],
                          ),
                        ),
                      ),
                    ],
                  ) , 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
