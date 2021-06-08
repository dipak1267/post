/*



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
                var  _Data = httpservices.loginuser(_id, _customer,_quantity,_price);
                  setState(() {
                    final _Data = List<dynamic>.from(
                      data.map<dynamic>(
                            (dynamic item) => item,
                      ),
                    );
                  });

                  },

                ),
              ),
          Container(
            child: FutureBuilder<Httpservices>(
                future: data,
                builder: (context, snapshot){
                  if(snapshot.data != null){
                    return Text(data.toString());
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








import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final Future<String> wait = Future<String>.delayed(
    const Duration(seconds: 2),
        () => 'Data Loaded',
  );

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('future builder'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<String>(
                future: wait,
                builder: (BuildContext context ,AsyncSnapshot<String> snapshot){
                  if(!snapshot.hasData){
                    return CircularProgressIndicator();
                  }
                  else if(snapshot.hasData){
                    return  Text('Result: ${snapshot.data}');
                  }else{
                    return Text("eroor");
                  }
                })
          ],
        ),
      ),
    );
  }
}


 */