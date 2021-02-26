import 'package:flutter/material.dart';
import 'package:grocerylist/main.dart';
import 'package:grocerylist/widget/dismissible_widget.dart';
import '../main.dart';

class ArchiveScreen extends StatefulWidget {
  @override
  _ArchiveScreenState createState() => _ArchiveScreenState();
  final List ListsToArchive = new List();
}

class _ArchiveScreenState extends State<ArchiveScreen> {

  List archiveLists = List();


  @override
  void initState() {
    archiveLists.add("Beispiel 1");
    archiveLists.add("Beispiel 1");
    archiveLists.add("Beispiel 1");
    archiveLists.add("Beispiel 1");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Archiv"),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new ListTile(
              title: Text("Einkaufslisten"),
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new MyApp()
                ));
              }
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: archiveLists.length,
        itemBuilder: (BuildContext context, int index) {
          return DismissibleWidget(
            child: Card(
              child: ListTile(title: Text(archiveLists[index]),),
            ),
            item: archiveLists[index],
          );
        },
      ),
    );
  }
  void archivingLists(
      List list,
      ){
          for(int i =0; i<list.length; i++){
            archiveLists.add(list[i]);
          }
       }
}