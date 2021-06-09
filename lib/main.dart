
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart'as http;

import 'data_model.dart';

void main(){
  runApp(MaterialApp(
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  Future<String>? resdata;
  bool isloading = false;
  var id = TextEditingController();
  var customer =TextEditingController();
  var quantity = TextEditingController();
  var price = TextEditingController();

  onclick(){

  }
  apidata(id,cu,qu,pr)async{
    var res = await http.post(
      Uri.https("reqbin.com", "/echo/post/json"),
      body: jsonEncode(<String, dynamic> {
        "Id": id,
        "Customer": cu,
        "Quantity": qu,
        "Price": pr
      }),

    );
      if(res.statusCode == 200){
        var data = dataModelFromJson(res.body);
        setState(() {
          resdata = Future.delayed(Duration.zero).then((value) {
            print(data.success);
            return data.success;
          });
        });
      }else{
        setState(() {
          resdata = Future.delayed(Duration.zero).then((value) {
            isloading = false;
            return 'false';
          });
        });
      }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("api res"),
      ),
      body: FutureBuilder(
          future: resdata,
          builder: (context,snapshot){
              List<Widget> children;
              if(snapshot.hasData){
                children = <Widget>[
                  const Icon(
                    Icons.check_circle_outline_outlined,
                    color: Colors.green,
                    size: 60,
                  ),
                  Padding(padding: EdgeInsets.only(top: 17),
                  child: Text('Result: ${snapshot.data}'),
                  )
                ];
              }else if(snapshot.hasError){
                children = <Widget>[
                 const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
            Padding(padding: EdgeInsets.only(top: 17),
            child: Text('Result: ${snapshot.data}'),
            )
                ];
              }else{
               CircularProgressIndicator();
              }
              return ui();
      })

    );
  }
  ui(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Container(

          child: TextField(
            controller: id,
            decoration: InputDecoration(
              hintText: 'user id',
              hintStyle: TextStyle(
                color: Colors.black,
              ),

              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),

          ),
        ),
        Container(

          child: TextField(
            controller: customer,
            decoration: InputDecoration(
              hintText: 'user name',
              hintStyle: TextStyle(
                color: Colors.black,
              ),

              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),

          ),
        ),
        Container(

          child: TextField(
            controller: quantity,
            decoration: InputDecoration(
              hintText: 'user quantity',
              hintStyle: TextStyle(
                color: Colors.black,
              ),

              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),

          ),
        ),
        Container(

          child: TextField(
            controller: price,
            decoration: InputDecoration(
              hintText: 'price',
              hintStyle: TextStyle(
                color: Colors.black,
              ),

              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),

          ),
        ),


        Center(
          child: TextButton(child: Text('submit'),
            onPressed:  (){
              apidata(id.text,customer.text,quantity.text,price.text);
            }
          ),
        ),
      ],
    );
  }

}

