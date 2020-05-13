import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  bool _visible = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      Timer(Duration(milliseconds: 1000), () => _visible = false);
    });
    Timer(Duration(seconds: 3), () => Navigator.of(context).pushReplacementNamed('/home_page'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(173, 40, 49, 0.5),
      child: AnimatedOpacity(
        opacity: _visible ? 1 : 0,
        duration: Duration(milliseconds: 1500),
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Theme.of(context).primaryColorDark),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('images/twins_logo_red.png'),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Twins Bar & Restaurante',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[Image.asset('images/capidevs_logo.png')],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
