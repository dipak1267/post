/*
Column(
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
      ),

 */