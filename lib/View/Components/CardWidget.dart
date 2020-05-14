import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget CardWidget(context,{String title,String subTitle, String hours,AssetImage image,Function navigatorToPage}){

  final TextStyle _textTitle = TextStyle(color:Colors.white,fontSize:30,fontWeight: FontWeight.w700, fontFamily: 'Lato');
  final TextStyle _textSubTitle = TextStyle(color:Color.fromRGBO(240, 240, 240, 1),fontSize:16,fontWeight: FontWeight.w500, fontFamily: 'Lato');


  return Card(
    elevation: 8,
    margin: EdgeInsets.all(10),
    borderOnForeground: true,
    color: Colors.grey,
    child: Container(
      height: MediaQuery.of(context).size.height * 0.33,
      width: MediaQuery.of(context).size.width,
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
              Spacer(flex: 140),
              Expanded(
                flex: 105,
                child: Container(
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
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                                child:SizedBox(width: MediaQuery.of(context).size.width*0.75, child: AutoSizeText(title,style:_textTitle,textAlign: TextAlign.start, maxLines: 1, overflow: TextOverflow.ellipsis,))

                          ),
                            ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                              child: SizedBox( width: MediaQuery.of(context).size.width*0.75, child: AutoSizeText(subTitle,style:_textSubTitle,textAlign: TextAlign.start, maxLines: 2,)),
                            ),
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
              ),
            ],
          )

        )
      )
  );
}