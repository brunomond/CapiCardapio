import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import './comidas_bar.dart' as first;
import './bebidas_bar.dart' as second;


class MenuBar extends StatefulWidget {
  @override
  MenuBarState createState() => MenuBarState();
}

class MenuBarState extends State<MenuBar> with SingleTickerProviderStateMixin {

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
          title: AutoSizeText('Cardápio do bar', style: TextStyle(fontSize: 20),),
          backgroundColor: Theme.of(context).primaryColor,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(onTap: _changeMenu, child: Icon(Icons.brightness_3, color: Colors.white,)),
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
          first.ComidasBar(),
          second.BebidasBar()
        ],
      ),
    );
  }

  void _changeMenu(){
    Navigator.pushReplacementNamed(context, '/menu_rest');
  }
}