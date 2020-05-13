import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import './comidas_rest.dart' as first;
import './bebidas_rest.dart' as second;

class MenuRest extends StatefulWidget {
  @override
  MenuRestState createState() => MenuRestState();
}

class MenuRestState extends State<MenuRest> with SingleTickerProviderStateMixin {

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
          title: AutoSizeText('Cardápio do restaurante', style: TextStyle(fontSize: 20),),
          backgroundColor: Theme.of(context).primaryColor,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(onTap: _changeMenu, child: Icon(Icons.wb_sunny, color: Colors.white,)),
            )
          ],
          bottom: TabBar(
              indicatorColor: Colors.white,
              controller: controller,
              tabs: <Tab>[
                Tab(icon: Text('COMIDAS')),
                Tab(icon: Text('BEBIDAS')),
              ]
          )
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget> [
          first.ComidasRest(),
          second.BebidasRest()
        ],
      ),
    );
  }

  void _changeMenu(){
    Navigator.pushReplacementNamed(context, '/menu_bar');
  }
}