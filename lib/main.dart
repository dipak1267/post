
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data_model.dart';
import 'http_Services.dart';


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
  var httpservices = Httpservices();
  var data;

  // final Future wait = Future.delayed(
  //   const Duration(seconds: 2),
  //       () => data.toString(),
  // );
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('http req'),
      ),
      body: Column(
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
              onPressed: () async{
                final _id = id.text;
                final _customer = customer.text;
                final _quantity = quantity.text;
                final _price = price.text;
                var  _Data = await httpservices.loginuser(_id, _customer,_quantity,_price) as String;
                setState(() {
                  data = httpservices.ret;

                });

              },

            ),
          ),
          Container(
            child: FutureBuilder<Httpservices>(
                future: data,
                builder: (BuildContext context,AsyncSnapshot snapshot){
                  if(snapshot.data != null){
                    return Text('Data :- ${snapshot.data}');
                  }else{
                    return CircularProgressIndicator();
                  }

                }),

          ),

        ],
      ),
    );
  }
}



