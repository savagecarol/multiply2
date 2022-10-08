import 'package:flutter/material.dart';
import 'mycolor.dart';

class Tile extends StatefulWidget {

  String number;
  double width,height;
  int color;
  double size;
  Tile(this.number,this.width,this.height,this.color,this.size);

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _TileState();
    }
}

class _TileState extends State<Tile> {
  @override
    Widget build(BuildContext context) {

      return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            color: Color(widget.color),
            borderRadius: const BorderRadius.all(Radius.circular(5.0))),
        child: Center(
          child: Text(widget.number,style: TextStyle(fontSize:widget.size,fontWeight: FontWeight.bold,color: Colors.white),),
        ),
      );
    }
}