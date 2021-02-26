import 'package:flutter/material.dart';
import 'package:grocerylist/theme.dart';

class CollapsingListTile extends StatefulWidget {

  final String title;
  final IconData icon;
  final AnimationController animationController;

  CollapsingListTile({@required this.title, @required this.icon, @required this.animationController});

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {

  Animation <double> _widthAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widthAnimation = Tween<double>(begin: 250, end: 70,).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _widthAnimation.value,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Row(
        children: <Widget>[
          (_widthAnimation.value >= 220) ? Icon(widget.icon, color: Colors.black54, size: 38.0,) : Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Icon(widget.icon, color: Colors.black54, size: 38.0,),
          ),
          SizedBox(width: 10.0),
          (_widthAnimation.value >= 220) ? Text(widget.title, style: listTitleDefaultTextStyle,) : Container(),
        ],
      ),
    );
  }
}
