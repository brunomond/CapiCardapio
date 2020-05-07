import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {

  //Styles Text
  final TextStyle _textHeading = TextStyle(color:Colors.white,fontSize:18,fontFamily:'Lato',fontWeight: FontWeight.bold);
  final TextStyle _textMenu = TextStyle(color:Color.fromRGBO(3,3,3,1),fontSize:18,fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Drawer(
						child: ListView(
              children: <Widget>[
                DrawerHeader(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(153, 32, 40, 1),
                  ),
                  child:Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: AssetImage("images/twins_logo_red.png")
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                          child:Text(
                            "Twins Bar & Restaurante",
                            style: _textHeading),
                        )
                        
                      ],),
                  )
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home",style:_textMenu),
                  onTap: (){ 
                    Navigator.pushNamed(context,'/home_page');
                   },
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text("Favoritos",style:_textMenu),
                  onTap: (){ 
                    Navigator.pushNamed(context, '/favorite_page');
                   },
                ),
                ListTile(
                  leading: Icon(Icons.store),
                  title: Text("Sobre",style:_textMenu),
                  onTap: (){ 
                    Navigator.pushNamed(context, '/about_page');
                   },
                ),
                Container(
                  margin:EdgeInsets.fromLTRB(16,0,16,0),
                  height: 1,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey)
                    ),
                  )
                ),
                ListTile(
                  leading: Icon(Icons.supervisor_account),
                  title: Text("Admin",style:_textMenu),
                  onTap: (){ 
                    Navigator.pushNamed(context, '/admin_page');
                   },
                ),
                ]
            ),
      );
  }
}