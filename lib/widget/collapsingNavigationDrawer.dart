import 'package:flutter/material.dart';
import 'package:grocerylist/model/navigation_model.dart';
import 'package:grocerylist/widget/collapsingListTile.dart';

import '../theme.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  _CollapsingNavigationDrawerState createState() => _CollapsingNavigationDrawerState();


}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer> with SingleTickerProviderStateMixin{
  double maxWidth= 250;
  double minWidth=70;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500),);
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth,).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _animationController, builder: (context, widget) => getWidget(context, widget),);
  }

  Widget getWidget(context, widget){
    return Container(
      width: widthAnimation.value,
      color: drawerBackgroundColor,
      child: Column(
        children: <Widget>[

          (widthAnimation.value >= 220) ?Container(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
            child: Icon(Icons.shopping_bag, color: Colors.black54, size: 200,)
          ): Container(
              padding: const EdgeInsets.fromLTRB(0, 225, 0, 20),
              child: Icon(Icons.shopping_bag, color: Colors.black54, size: 38,)
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, counter){
              return CollapsingListTile(
                title: navigationItem[counter].title,
                icon: navigationItem[counter].icon,
                animationController: _animationController,
              );
            },
              itemCount: navigationItem.length,
            ),
          ),


        ],


      ),
    );
  }
}

