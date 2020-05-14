import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewPasswordPage extends StatefulWidget {
  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _oldPassController = TextEditingController();
  final TextEditingController _newPassController = TextEditingController();
  bool _edited;

  @override
  void initState() {
    super.initState();

    setState(() {
      _edited = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Alterar senha'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _oldPassController,
                          obscureText: true,
                          onChanged: (text) => _edited = true,
                          decoration: InputDecoration(
                              labelText: 'Senha anterior',
                              labelStyle: TextStyle(fontSize: 18)),
                          validator: (value) =>
                              value.isEmpty ? 'Insira sua senha' : null,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: TextFormField(
                            controller: _newPassController,
                            obscureText: true,
                            onChanged: (text) => _edited = true,
                            decoration: InputDecoration(
                                labelText: 'Nova senha',
                                labelStyle: TextStyle(fontSize: 18)),
                            validator: (value) =>
                                value.isEmpty ? 'Insira uma senha' : null,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: TextFormField(
                            obscureText: true,
                            onChanged: (text) => _edited = true,
                            decoration: InputDecoration(
                                labelText: 'Confirme a senha',
                                labelStyle: TextStyle(fontSize: 18)),
                            validator: (value) =>
                                (value != _newPassController.text)
                                    ? 'As senhas não correspondem'
                                    : null,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: RaisedButton(
                                  child: Text(
                                    'SALVAR',
                                    style: TextStyle(fontSize: 14),
                                    textAlign: TextAlign.center,
                                  ),
                                  textColor: Colors.white,
                                  color: Theme.of(context).primaryColor,
                                  onPressed: () async => _formKey.currentState
                                          .validate()
                                      ? updateStatus(await _updatePassword())
                                      : null,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateStatus(String statusText) {
    String snackText = '';
    switch (statusText) {
      case 'success':
        Navigator.of(context).pop(true);
        break;
      case 'already_used':
        snackText = 'Senha já está em uso!';
        break;
      case 'failure':
        snackText = 'Senha incorreta!';
        break;
    }

    _scaffoldKey.currentState.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(snackText),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(milliseconds: 1500),
    ));
  }

  Future<String> _updatePassword() async {
    dynamic ds = await _checkPassword();

    if (ds != null) {
      if (ds is DocumentSnapshot) {
        return await Firestore.instance
            .collection('user')
            .document(ds.documentID)
            .updateData({'senha': _newPassController.text}).then(
                (value) => 'success');
      } else {
        return 'already_used';
      }
    } else {
      return 'failure';
    }
  }

  Future _checkPassword() async {
    return await Firestore.instance
        .collection('user')
        .getDocuments()
        .then((value) {
      dynamic ds;
      value.documents.forEach((element) {
        if (element.data['senha'] == _oldPassController.text) {
          if (element.data['senha'] == _newPassController.text)
            ds = 'AlreadyUsed';
          else
            ds = element;
        }
      });
      return ds;
    });
  }

  Future<bool> _requestPop() {
    if (_edited) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Descartar Alterações?"),
                content: Text("Se sair as alterações serão perdidas!"),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      "Cancelar",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text(
                      "Sim",
                      style: TextStyle(color: Theme.of(context).disabledColor),
                    ),
                    onPressed: () {
                      Navigator.popUntil(
                          context, ModalRoute.withName('/admin_page'));
                    },
                  )
                ],
              ));
      return Future.value(false);
    }

    return Future.value(true);
  }
}
