import 'package:flutter/material.dart';

Widget EnderecoWidget(context){
  return Container(
          width: double.infinity,
          margin:EdgeInsets.fromLTRB(16, 8, 16, 8),
          padding:EdgeInsets.only(top: 8,left:16,right: 16,bottom:8),
          decoration: BoxDecoration(
            color:Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(2)),
            shape:BoxShape.rectangle,
          ),
          child:Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,8,0),
                child: Icon(Icons.phone,color:Colors.white,size:24),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                Text("(67) 99000-0000",style:TextStyle(color: Colors.white)),
                Text("(67) 99000-0000",style:TextStyle(color: Colors.white)),
                Text("(67) 3397-0000",style:TextStyle(color: Colors.white))
              ],)
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,8,0),
                child: Icon(Icons.map,color:Colors.white,size:24),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                Text("Av. Afonso Pena",style:TextStyle(color: Colors.white)),
                Text("N 1030",style:TextStyle(color: Colors.white)),
                Text("Jardim dos Estados",style:TextStyle(color: Colors.white))
              ],)
            ],)

    ],),);
}