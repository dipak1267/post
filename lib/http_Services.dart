
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'data_model.dart';

//
class Httpservices{
  var ret;
  Future<http.Response> loginuser(String id,String cu, String qu,String pr) async{

    var res = await http.post(
      Uri.https("reqbin.com", "/echo/post/json"),
      body: jsonEncode(<String, dynamic> {
        "Id": id,
        "Customer": cu,
        "Quantity": qu,
        "Price": pr
      }),

    );
    print(res.statusCode);
    if(res.statusCode == 200){
        ret = jsonDecode(res.body);
      print(ret);

      return ret;
    }else{
      throw 'data not send';
    }
    print(res);
    return res;
  }

}