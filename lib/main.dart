
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

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
  @override
  var id = TextEditingController();
  var customer =TextEditingController();
  var quantity = TextEditingController();
  var price = TextEditingController();
   var data;
   bool isloading = false;
   Future<String>? calculation;
  var _id,_customer,_quantity,_price;



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('http req'),
      ),
      body:
      FutureBuilder<String>(
        future: calculation,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Result: ${snapshot.data}'),
              )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = <Widget>[  isloading ? CircularProgressIndicator() :
            ui()];

          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),




    );
  }

  onclick() async{
    _id = id.text;
    _customer = customer.text;
    _quantity = quantity.text;
    _price = price.text;
    data =   loginuser(_id, _customer,_quantity,_price);

    setState(() {

    });
  }

   loginuser(String id,String cu, String qu,String pr) async{
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
        calculation = Future.delayed(Duration.zero).then((value) {
          isloading =  true;
          return data.success.toString();
        });
      });
    }else{
      setState(() {
        calculation = Future.delayed(Duration.zero).then((value) {
          isloading = true;
          return "false";
        });
      });
    }
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
            onPressed:  onclick(),
          ),
        ),

        Container(
            child: FutureBuilder(
                future: calculation,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return Center(
                      child: Text('Result : ${snapshot.data}'),
                    );
                  }else{
                    throw 'eroor';
                  }

                })

        ),

      ],
    );
  }

}



