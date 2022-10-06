import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  String number;
  double width,height;
  Color color;
  double size;
  Tile(this.number,this.width,this.height,this.color,this.size, {Key? key}) : super(key: key);

  @override
    State<StatefulWidget> createState() {
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
            color: widget.color,
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        child: Center(
          child: Text(widget.number,style: TextStyle(fontSize:widget.size,fontWeight: FontWeight.bold,color: Colors.white),),
        ),
      );
    }
}