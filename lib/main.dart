import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:post/redux/model/item_model.dart';
import 'package:post/redux/redux_/reducer.dart';
import 'package:post/redux/redux_screen/data_list.dart';
import 'package:post/redux/widgets/show_dialouge.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

void main() {
  List<ItemModel> list = [
    ItemModel(name: "dipak", check: false),
  ];
  final store = new DevToolsStore<List<ItemModel>>(ItemReducer, initialState: list);
  runApp(LoadState(
    store: store,
  ));
}
class LoadState extends StatelessWidget {
  DevToolsStore<List<ItemModel>> store;

  LoadState({required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<List<ItemModel>>(
      store: store,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: HomeApp(store: store),
      ),
    );
  }
}
class HomeApp extends StatelessWidget {
  DevToolsStore<List<ItemModel>> store;
    HomeApp({required this.store});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: ()=> _addDialog(context),
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("DEMO APP"),
        ),
        body: DataList(),
      endDrawer: ReduxDevTools(store),

    );
  }
}

_addDialog(BuildContext context) {
  showDialog(context: context, builder: (BuildContext context) => AddItemDialog());
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
