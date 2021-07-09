import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:post/redux/redux_/actions.dart';
import 'package:post/redux/model/item_model.dart';
class AddItemDialog extends StatefulWidget {
  const AddItemDialog({Key? key}) : super(key: key);

  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  @override
  var name = TextEditingController();
  String itemName = "yash";
  Widget build(BuildContext context) {
    return StoreConnector<List<ItemModel>, onItemAddedCallback>(
      converter: (store) => (itemName) => store.dispatch(AddItemAction(ItemModel(name: itemName, check: false))),
      builder: (context, callback) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(08),
      title: Text("Add Item"),
      content: Row(
        children: [
          Expanded(child: TextField(
            autofocus: true,
            controller: name,
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
          callback(name.text);
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
