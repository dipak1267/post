import 'package:post/redux/model/item_model.dart';

import 'actions.dart';

List<ItemModel> ItemReducer(List<ItemModel> items, dynamic acton) {
  if (acton is AddItemAction) {
    return addItem(items, acton);
  } else if (acton is ToggleStateAction) {
      return toggleState(items, acton);
  } else if (acton is DeleteItemAction) {
    return deleteItem(items, acton);
  }
  return items;
}

List<ItemModel> addItem(List<ItemModel> items, AddItemAction acton) {
  return List.from(items)..add(acton.item);
}

List<ItemModel> toggleState(List<ItemModel> items, ToggleStateAction acton) {
  List<ItemModel> newItem = items
      .map(
        (item) => item.name == acton.item.name ? acton.item : item,
      )
      .toList();
  return newItem;
}

List<ItemModel> deleteItem(List<ItemModel> items, DeleteItemAction acton) {
  return List.from(items)..remove(acton.item);
}