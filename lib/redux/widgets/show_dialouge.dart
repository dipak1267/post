import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:post/redux/model/item_model.dart';
class AddItemDialog extends StatefulWidget {
  const AddItemDialog({Key? key}) : super(key: key);

  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  @override
  String Name = " ";
  Widget build(BuildContext context) {
    return StoreConnector<List<ItemModel>, onItemAddedCallback>(
      converter: (store) => (itemName) => store,

  builder: (context, callback) {
    return AlertDialog(
      title: Text("Add Item"),
      content: Row(
        children: [
          Expanded(child: TextField(
            autofocus: true,
            onChanged: (val) {
              setState(() {
                val = Name;
              });
            },
            decoration: InputDecoration(
              labelText: 'Item Name',
              hintText: 'Ig :- iphone',
            ),
          )),
        ],
      ),
      actions: <Widget>[
        FlatButton(onPressed: (){Get.back();}, child: Text("Cancel")),
        FlatButton(onPressed: (){
          callback(Name);
          Get.back();}, child: Text("Add")),
      ],
    );
  },
);
  }
}
typedef onItemAddedCallback = Function(String itemName);


/*
 Get.defaultDialog(
    title: "Add Item",
    content: Row(
      children: [
        Expanded(child: TextField(
          autofocus: true,
          decoration: InputDecoration(
            labelText: 'Item Name',
            hintText: 'Ig :- iphone',
          ),
        )),
      ],
    ),
    actions: <Widget>[
      FlatButton(onPressed: (){Get.back();}, child: Text("Cancel")),
      FlatButton(onPressed: (){Get.back();}, child: Text("Add")),
    ],
  );
 */
