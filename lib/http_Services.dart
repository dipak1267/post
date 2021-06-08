
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'data_model.dart';

//
class Httpservices{
  Future<DataModel> loginuser(String id,String cu, String qu,String pr) async{

    var res = await http.post(
      Uri.http("reqbin.com", "/echo/post/json"),
      body: jsonEncode(<String, dynamic> {
        "Id": id,
        "Customer": cu,
        "Quantity": qu,
        "Price": pr
      }),

    );
    if(res.statusCode == 200){
      var str = res.body;
      return dataModelFromJson(str);
    }else{
      throw 'data not send';
    }
    // print(res);
    // return res;
  }

}