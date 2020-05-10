import 'package:CapiCardapio/View/Components/AppBarWidget.dart';
import 'package:CapiCardapio/View/DrawerPage/DrawerPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPage extends StatefulWidget {
  final String title;

  const AdminPage({Key key, this.title}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  bool _logged = false;

  @override
  void initState() {
    super.initState();
    testLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(title: widget.title),
        drawer: DrawerPage(),
        body: _logged
            ? ListView(
                children: <Widget>[
                  Text('Admin'),
                  FlatButton(
                    child: Text('LogOut'),
                    onPressed: logout,
                  )
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }

  void testLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var status = prefs.getBool('logged') ?? false;

    if (status) {
      setState(() {
        _logged = status;
      });
    } else {
      Navigator.pushReplacementNamed(context, '/login_admin');
    }
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('logged', false);

    setState(() {
      _logged = prefs.getBool('logged');
    });

    Navigator.popAndPushNamed(context, '/login_admin');
  }
}
