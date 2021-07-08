class ItemModel{
  String name;
  bool check;
  ItemModel({required this.name,required this.check});
  String toString(){
    return "$name : $check";
  }

}