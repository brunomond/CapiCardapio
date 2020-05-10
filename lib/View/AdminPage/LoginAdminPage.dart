import 'package:CapiCardapio/View/Components/AppBarWidget.dart';
import 'package:CapiCardapio/View/DrawerPage/DrawerPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAdminPage extends StatefulWidget {
  final String title;

  const LoginAdminPage({Key key, this.title}) : super(key: key);

  @override
  _LoginAdminPageState createState() => _LoginAdminPageState();
}

class _LoginAdminPageState extends State<LoginAdminPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _loginController.text = '';
    _passwordController.text = '';
    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: (AppBarWidget(title: widget.title)),
      drawer: DrawerPage(),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Flexible(
                    child: Image.asset(
                      'images/admin.png',
                    ),
                  ),
                  Text(
                    'Administrador',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'lato',
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          controller: _loginController,
                          decoration: InputDecoration(
                              labelText: 'login',
                              labelStyle: TextStyle(fontSize: 18)),
                          validator: (value) =>
                              value.isEmpty ? 'Insira seu login!' : null,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                                labelText: 'senha',
                                labelStyle: TextStyle(fontSize: 18)),
                            obscureText: true,
                            validator: (value) =>
                                value.isEmpty ? 'Insira sua senha!' : null,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                onPressed: () async =>
                                    _formKey.currentState.validate()
                                        ? await _checkLogin()
                                            ? _login()
                                            : showSnack()
                                        : null,
                                child: Text(
                                  'ENTRAR',
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                                textColor: Colors.white,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _checkLogin() async {
    Map<String, dynamic> values = await _getData();
    return values['login'] == _loginController.text &&
        values['senha'] == _passwordController.text;
  }

  Future<Map> _getData() async {
    QuerySnapshot querySnapshot =
        await Firestore.instance.collection('user').getDocuments();

    return querySnapshot.documents[0].data;
  }

  void _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('logged', true);

    Navigator.pushReplacementNamed(context, '/admin_page');
  }

  void showSnack() {
    _scaffoldKey.currentState.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Usuário ou senha incorretos!'),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(milliseconds: 1500),
    ));
    _loginController.clear();
    _passwordController.clear();
  }
}
