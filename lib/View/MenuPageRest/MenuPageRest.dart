import 'package:flutter/material.dart';
import './comidas_rest.dart' as first;
import './bebidas_rest.dart' as second;

void main() => runApp(MaterialApp(
  home: MyTabs(),
));

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {

  TabController controller;

  Text _title = Text("Cardápio do Restaurante");
  IconData iconBar = Icons.wb_sunny;

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
          title: _title,
          backgroundColor: Color.fromRGBO(173, 40, 49, 1),
          actions: <Widget>[
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(top:8,bottom:8,left:16,right:16),
                child: Icon(iconBar,color:Colors.white),
              ),
              onTap: (){
                setState(() {
                  _title = Text(_title.data == 'Cardápio de Bar' ? 'Cardápio do Restaurante' : 'Cardápio de Bar');
                  iconBar = _title.data == 'Cardápio de Bar' ? Icons.brightness_3 : Icons.wb_sunny;
                });
              }
            )
          ],
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