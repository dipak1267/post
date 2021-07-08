import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:post/redux/model/item_model.dart';
import 'package:post/redux/redux_/actions.dart';

class Items extends StatefulWidget {
  const Items({Key? key,required this.item}) : super(key: key);
  final ItemModel item;
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<ItemModel>, OnToggleDeleteAction>(
      converter: (store) => (itemName){
        store.dispatch(DeleteItemAction(widget.item));
      },
    builder: (context, callback) {
    return Dismissible(key: Key(widget.item.name),
        onDismissed: (_){
      setState(() {
        callback(widget.item.name);
      });
        },
        child:StoreConnector <List<ItemModel>, OnToggleStateAction>(
          converter: (store)=> (item) => store.dispatch(ToggleStateAction(item)),
          builder: (context, callback) =>  ListTile(
            title: Text(widget.item.name),
            leading: Checkbox(value: widget.item.check, onChanged:(value){
              setState(() {
                print(widget.item.check);
                callback(ItemModel(name: widget.item.name, check: true));
              });
            }),
          ),
        ),);
  },
);
  }
}
typedef OnToggleStateAction = Function(ItemModel item);
typedef OnToggleDeleteAction = Function(String itemName);
