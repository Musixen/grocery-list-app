import 'package:flutter/material.dart';
import 'package:grocerylist/widget/collapsingNavigationDrawer.dart';
import 'package:grocerylist/widget/dismissible_widget.dart';
import 'package:grocerylist/widget/shoppingListDialogDescription.dart';
import './view/archiveScreen.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    accentColor: Colors.greenAccent,
  ),
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List shoppingLists = List();
  List forarchiveLists = List();
  String input = "";

  @override
  void initState() {
    super.initState();
    shoppingLists.add("Liste 1");
    shoppingLists.add("Liste 2");
    shoppingLists.add("Liste 3");
    shoppingLists..add("Liste 4");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Einkaufslisten"),
      ),
      drawer: CollapsingNavigationDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Neue Einkaufsliste"),
              content: TextField(
                onChanged: (String value) {
                  input = value;
                },
              ),
              actions: <Widget>[
                FlatButton(onPressed: () {
                  setState(() {
                    shoppingLists.add(input);
                  });
                }
                    , child: Text("Erstellen"))
              ],
            );
          });
        },
        child: Icon(Icons.add, color: Colors.black,),
      ),
      body: ListView.builder(
        itemCount: shoppingLists.length,
        itemBuilder: (BuildContext context, int index) {
          return DismissibleWidget(
              onDismissed: (direction) =>
                  dismissItem(context, index, direction),
              key: Key(shoppingLists[index]),
              child: Card(
                child: ListTile(title: Text(shoppingLists[index]),),
              ));
        },
      ),
    );
  }

  void dismissItem(
      BuildContext context,
      int index,
      DismissDirection direction,
      ) {
    setState(() {
      shoppingLists.removeAt(index);
      });

    switch(direction){

      case DismissDirection.vertical:
        // TODO: Handle this case.
        break;
      case DismissDirection.horizontal:
        // TODO: Handle this case.
        break;
      case DismissDirection.endToStart:
        shoppingLists.removeAt(index);
        break;
      case DismissDirection.startToEnd:
        shoppingLists.add("hi");
        break;
      case DismissDirection.up:
        // TODO: Handle this case.
        break;
      case DismissDirection.down:
        // TODO: Handle this case.
        break;
    }
  }
}



