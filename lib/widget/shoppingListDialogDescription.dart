import 'package:flutter/material.dart';

class ShoppingListDialogDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Einkaufsliste bearbeiten"),
      content: Column(
        children: [
          TextField(
            decoration: InputDecoration(
            hintText: "Wo einkaufen?",
          ),),
          TextField(
            decoration: InputDecoration(
              hintText: "Beschreibung",
            ),
          ),
        ],
      ),
    );
  }
}
