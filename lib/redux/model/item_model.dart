class ItemModel{
  String name;
  bool? check = false;
  ItemModel({required this.name,required this.check});
  String toString(){
    return "$name : $check";
  }

}