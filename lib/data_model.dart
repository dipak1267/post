import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.success,
  });

  String success;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
  };
}
