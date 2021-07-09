import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:post/redux/model/item_model.dart';
import 'package:post/redux/widgets/list_items.dart';

class DataList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<ItemModel>, List<ItemModel>>(
      converter: (store) => store.state,
      builder: (context, list) => ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => Items(item: list[index], ),
      ),

    );
  }
}
