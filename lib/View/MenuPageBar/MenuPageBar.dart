import 'package:flutter/material.dart';
import './comidas_bar.dart' as first;
import './bebidas_bar.dart' as second;

void main() => runApp(MaterialApp(
  home: CardapioBar(),
));

class CardapioBar extends StatefulWidget {
  @override
  CardapioBarState createState() => CardapioBarState();
}

class CardapioBarState extends State<CardapioBar> with SingleTickerProviderStateMixin {

  TabController controller;

  Text _title = Text("Cardápio do Bar");
  IconData iconBar = Icons.brightness_3;

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
          backgroundColor: Theme.of(context).primaryColor,
          actions: <Widget>[
            InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(top:8,bottom:8,left:16,right:16),
                  child: Icon(iconBar,color:Colors.white),
                ),
                onTap: (){
                  setState(() {
                    _title = Text(_title.data == 'Cardápio do Restaurante' ? 'Cardápio do Bar' : 'Cardápio do Restaurante');
                    iconBar = _title.data == 'Cardápio do Restaurante' ? Icons.wb_sunny : Icons.brightness_3;
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