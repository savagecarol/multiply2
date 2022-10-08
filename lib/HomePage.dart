import 'package:flutter/material.dart';
import 'package:multiply2/Game.dart';
import 'package:multiply2/Tile.dart';
import 'package:multiply2/grid.dart';
import 'MyColor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<List<int>> grid = blankGrid();
  List<List<int>> gridNew = blankGrid();
  late SharedPreferences sharedPreferences;
  int score = 0;
  bool isgameOver = false;
  bool isgameWon = false;

  List<Widget> getGrid(double width, double height) {
    List<Widget> grids = [];
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        int num = grid[i][j];
        String number;
        int color;
        if (num == 0) {
          color = MyColor.emptyGridBackground;
          number = "";
        } else if (num == 2 || num == 4) {
          color = MyColor.gridColorTwoFour;
          number = "$num";
        } else if (num == 8 || num == 64 || num == 256) {
          color = MyColor.gridColorEightSixtyFourTwoFiftySix;
          number = "$num";
        } else if (num == 16 || num == 32 || num == 1024) {
          color = MyColor.gridColorSixteenThirtyTwoOneZeroTwoFour;
          number = "$num";
        } else if (num == 128 || num == 512) {
          color = MyColor.gridColorOneTwentyEightFiveOneTwo;
          number = "$num";
        } else {
          color = MyColor.gridColorWin;
          number = "$num";
        }
        double size = 20.0;
        String n = number;
        switch (n.length) {
          case 1:
          case 2:
            size = 40.0;
            break;
          case 3:
            size = 30.0;
            break;
          case 4:
            size = 20.0;
            break;
        }
        grids.add(Tile(number, width, height, color, size));
      }
    }
    return grids;
  }

  void handleGesture(int direction) {
    /*
    
      0 = up
      1 = down
      2 = left
      3 = right

    */
    bool flipped = false;
    bool played = true;
    bool rotated = false;
    if (direction == 0) {
      setState(() {
        grid = transposeGrid(grid);
        grid = flipGrid(grid);
        rotated = true;
        flipped = true;
      });
    } else if (direction == 1) {
      setState(() {
        grid = transposeGrid(grid);
        rotated = true;
      });
    } else if (direction == 2) {
    } else if (direction == 3) {
      setState(() {
        grid = flipGrid(grid);
        flipped = true;
      });
    } else {
      played = false;
    }

    if (played) {
      List<List<int>> past = copyGrid(grid);
      for (int i = 0; i < 4; i++) {
        setState(() {
          List result = operate(grid[i], score, sharedPreferences);
          score = result[0];
          grid[i] = result[1];
        });
      }
      setState(() {
        grid = addNumber(grid, gridNew);
      });
      bool changed = compare(past, grid);
      if (flipped) {
        setState(() {
          grid = flipGrid(grid);
        });
      }

      if (rotated) {
        setState(() {
          grid = transposeGrid(grid);
        });
      }

      if (changed) {
        setState(() {
          grid = addNumber(grid, gridNew);
        });
      }

      bool gameover = isGameOver(grid);
      if (gameover) {
        setState(() {
          isgameOver = true;
        });
      }

      bool gamewon = isGameWon(grid);
      if (gamewon) {
        setState(() {
          isgameWon=true;          
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    gridNew = blankGrid();
    addNumber(grid, gridNew);
    addNumber(grid, gridNew);
  }

  Future<String> getHighScore() async {
    sharedPreferences = await SharedPreferences.getInstance();
    int? score = sharedPreferences.getInt('high_score');
    return score.toString();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    double gridWidth = (width - 80) / 4;
    double gridHeight = gridWidth;
    double height =  (gridHeight * 4) + 48;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            '2048',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          backgroundColor:  Colors.blue[400],
        ),
        body: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 64),
          child: Column(
            children: <Widget>[  
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color:  Colors.blue[400],
                  ),
                   child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32 , vertical: 16),
                    child: Center(
                      child: Column(
                        children:  [
                        const Text(
                           'SCORE',
                           style: TextStyle(
                               fontSize: 24.0,
                               color: Colors.white,
                               fontWeight: FontWeight.bold),
                         ),
                          const SizedBox(height : 8),
                         Text(
                            '${score}',
                            style: const TextStyle(
                                fontSize: 28.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                          ]),
                    )),
                  ),
                          Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color:  Colors.blue[400],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                    iconSize: 35.0,
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        grid = blankGrid();
                        gridNew = blankGrid();
                        grid = addNumber(grid, gridNew);
                        grid = addNumber(grid, gridNew);
                        score = 0;
                        isgameOver=false;
                        isgameWon=false;
                      });
                    },
                  ),
                ),
              ) ,
                   Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color:  Colors.blue[400],
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32 , vertical: 16),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                         const Text(
                             'BEST',
                            style: TextStyle(
                               fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height : 8),
                          FutureBuilder<String>(
                            future: getHighScore(),
                            builder: (ctx, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!,
                                  style: const TextStyle(
                                     fontSize: 28,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                );
                              } else {
                                return const Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 28,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )
    
                ],
              ),
              const SizedBox(height: 48,),
              Container(
                height: height,
                decoration: const  BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        child: GridView.count(
                          primary: false,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                          crossAxisCount: 4,
                          children: getGrid(gridWidth, gridHeight),
                        ),
                        onVerticalDragEnd: (DragEndDetails details) {
                          //primaryVelocity -ve up +ve down
                          if (details.primaryVelocity! < 0) {
                            handleGesture(0);
                          } else if (details.primaryVelocity! > 0) {
                            handleGesture(1);
                          }
                        },
                        onHorizontalDragEnd: (details) {
                          //-ve right, +ve left
                          if (details.primaryVelocity! > 0) {
                            handleGesture(2);
                          } else if (details.primaryVelocity! < 0) {
                            handleGesture(3);
                          }
                        },
                      ),
                    ),
                    isgameOver
                        ? Container(
                            height: height,
                            color: Colors.white,
                            child: const Center(
                              child: Text(
                                'Game over!',
                                style: TextStyle(
                                  
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          )
                        : const SizedBox(),
                    isgameWon
                        ? Container(
                            height: height,
                            color: Colors.white,
                            child: const Center(
                              child: Text(
                                'You Won!',
                                style: TextStyle(
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          )
                        : const SizedBox(),    
                  ],
                ),
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
