import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:post/redux/model/item_model.dart';
import 'package:post/redux/redux_/reducer.dart';
import 'package:post/redux/redux_screen/data_list.dart';
import 'package:post/redux/widgets/show_dialouge.dart';
import 'package:redux/redux.dart';
void main(){
  final store = new Store<List<ItemModel>>(ItemReducer,initialState: List());
  runApp(HomeApp(store: store,));
}
class HomeApp extends StatelessWidget {
  Store<List<ItemModel>> store;
    HomeApp({required this.store});
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          floatingActionButton: FloatingActionButton(onPressed:() => _addDialog(context),child: Icon(Icons.add),),
          appBar: AppBar(
            title: Text("DEMO APP"),
          ),

          body: DataList(),
        ),
      ),
    );
  }
}
_addDialog(BuildContext context){
  showDialog(context: context, builder: (context)=> AddItemDialog());
}







//
//
// void main() {
//   runApp(MaterialApp(
//     home: Homepage(),
//   ));
// }
//
//
//
// class Homepage extends StatelessWidget {
//   var tabs = [
//    Column(children: [Text("Line "),Icon(Icons.show_chart)],),
//     Column(children: [Text("Pie"),Icon(Icons.pie_chart)],),
//     Column(children: [Text("bar"),Icon(Icons.show_chart)],),
//   ];
//   var TabView = [
//     LineChartPage(),
//     PieChartPage(),
//     BarChartPage(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Chart views"),
//           bottom: TabBar(
//             tabs: tabs,
//           )
//
//         ),
//         body: TabBarView(
//             children: TabView
//         ),
//     ),
//     );
//   }
// }