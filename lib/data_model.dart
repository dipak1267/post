import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.id,
    required this.customer,
    required this.quantity,
    required this.price,
  });

  int id;
  String customer;
  int quantity;
  int price;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    id: json["Id"],
    customer: json["Customer"],
    quantity: json["Quantity"],
    price: json["Price"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Customer": customer,
    "Quantity": quantity,
    "Price": price,
  };
}
