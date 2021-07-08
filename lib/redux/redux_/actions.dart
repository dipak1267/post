import 'package:post/redux/model/item_model.dart';

class AddItemAction{
  final ItemModel item;
  AddItemAction(this.item);
}
class DeleteItemAction{
  final ItemModel item;
  DeleteItemAction(this.item);
}
class ToggleStateAction{
  final ItemModel item;
  ToggleStateAction(this.item);
}
