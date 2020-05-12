import 'package:flutter/material.dart';

Widget CardWidget(context,{String title,String subTitle, String hours,AssetImage image,Function navigatorToPage}){

  final TextStyle _textTitle = TextStyle(color:Colors.white,fontSize:22,fontWeight: FontWeight.bold);
  final TextStyle _textSubTitle = TextStyle(color:Color.fromRGBO(240, 240, 240, 1),fontSize:16,fontWeight: FontWeight.w400);
  

  return Card(
    elevation: 8,
    margin: EdgeInsets.fromLTRB(16,8,16,8),
    borderOnForeground: true,
    color: Colors.grey,
    child: Container(
      height: 245,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2)),
        shape:BoxShape.rectangle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: image
        )
      ),
      child: 
      InkWell(
          splashColor: Theme.of(context).primaryColor,
          onTap: navigatorToPage,
          child:
          Column(
            verticalDirection: VerticalDirection.down,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 140),
              Container(
                width: double.infinity,
                height: 105,
                padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(2)),
                  shape:BoxShape.rectangle,
                  gradient: 
                    LinearGradient(
                      begin:Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color.fromRGBO(0, 0, 0, .8) , Color.fromRGBO(0, 0, 0, .1)])
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                          child: Text(title,style:_textTitle,textAlign: TextAlign.start),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                          child: Text(subTitle,style:_textSubTitle,textAlign: TextAlign.start),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                          Icon(Icons.access_time,size:24,color:Colors.white),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,0,0,0),
                            child: Text("Aberto das $hours",style:TextStyle(color:Colors.white,fontSize: 14),textAlign: TextAlign.start),
                          )
                        ],)
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child:Icon(Icons.arrow_forward,size:24,color:Colors.white)
                    )
                  ],
                ),
              ),
            ],
          )
              
        )
      )
  );
}