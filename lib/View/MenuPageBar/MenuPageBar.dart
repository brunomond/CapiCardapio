import 'package:flutter/material.dart';
import 'package:CapiCardapio/View/Ultis.dart';
import './comidas_bar.dart' as first;
import './bebidas_bar.dart' as second;

void main() => runApp(MaterialApp(
  home: MyTabs(),
));

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text ("Cardápio do Bar"),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(173, 40, 49, 1),
          bottom: TabBar(
              indicatorColor: Colors.white,
              controller: controller,
              tabs: <Tab>[
                Tab(icon: Text("COMIDAS")),
                Tab(icon: Text("BEBIDAS")),
              ]
          )
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget> [
          first.Comidas(),
          second.Bebidas()
        ],
      ),
    );
  }
}