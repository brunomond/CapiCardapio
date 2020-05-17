import 'package:CapiCardapio/View/Components/AppBarWidget.dart';
import 'package:CapiCardapio/View/Components/CardWidget.dart';
import 'package:CapiCardapio/View/Components/EnderecoWidget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:CapiCardapio/View/DrawerPage/DrawerPage.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    _initFavs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: widget.title),
      drawer: DrawerPage(selectedPage: 'home',),
      body: Container(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: CardWidget(
                context,
                title: "Restaurante",
                subTitle: "Pratos selecionados para sua refeição.",
                hours: "10:00 às 14:00",
                image: AssetImage('images/restaurant.jpg'),
                navigatorToPage: () {
                  Navigator.pushNamed(context, '/menu_rest');
                },
              ),
            ),
            Expanded(
              flex: 5,
              child: CardWidget(
                  context,
                  title: 'Bar e Happy Hour',
                  subTitle: 'Porções e bebidas para sua noite.',
                  hours: "18:00 às 00:00",
                  image: AssetImage('images/bar.jpg'),
                  navigatorToPage: () {
                    Navigator.pushNamed(context, '/menu_bar');
                  }
              ),
            ),
            Expanded(flex: 2, child: EnderecoWidget(context, onTapPhone: _onTapPhone, onTapAddress: _onTapAddress))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _onTapPhone(int i) {
    String phone = '';
    switch(i){
      case 1: phone ='(67) 99000-0000'; break;
      case 2: phone ='(67) 99000-0000'; break;
      case 3: phone ='(67) 3397-0000'; break;
    }
    showDialog(context: context, builder: (context) =>
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Expanded(
              child: AlertDialog(
                title: AutoSizeText('Ligar para $phone', maxLines: 1,),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      'Sim',
                      style: TextStyle(color: Theme
                          .of(context)
                          .primaryColor),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      launch('tel:$phone');
                    },
                  ),
                  FlatButton(
                    child: Text(
                      'Não',
                      style: TextStyle(color: Theme
                          .of(context)
                          .disabledColor),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
  
  void _onTapAddress(String address) {
    MapsLauncher.launchQuery(address);
  }


  void _initFavs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getStringList('favorites') == null ? prefs.setStringList('favorites', []) : null;
  }
}
