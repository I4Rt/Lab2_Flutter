import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab2_flutter/widgets/SideMenu.dart';
import 'package:lab2_flutter/widgets/card.dart';
import 'package:lab2_flutter/widgets/janre.dart';



class RateFilm extends StatelessWidget {
  String data;


  RateFilm({required this.data, Key? key}) :
        filmName = data!,
        super(key: key);
  late String filmName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: (){Navigator.pop(context);},
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Оцените фильм",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        filmName,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                        ),
                      )
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 55,
                            width: 55,
                            child: RaisedButton(
                              color: Colors.transparent,
                              onPressed: (){Navigator.pop(context);},
                              child: Image.asset("assets/img/Star_unselected.png"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 55,
                            width: 55,
                            child: RaisedButton(
                              color: Colors.transparent,
                              onPressed: (){Navigator.pop(context);},
                              child: Image.asset("assets/img/Star_unselected.png"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 55,
                            width: 55,
                            child: RaisedButton(
                              color: Colors.transparent,
                              onPressed: (){Navigator.pop(context);},
                              child: Image.asset("assets/img/Star_unselected.png"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 55,
                            width: 55,
                            child: RaisedButton(
                              color: Colors.transparent,
                              onPressed: (){Navigator.pop(context);},
                              child: Image.asset("assets/img/Star_unselected.png"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 55,
                            width: 55,
                            child: RaisedButton(
                              color: Colors.transparent,
                              onPressed: (){Navigator.pop(context);},
                              child: Image.asset("assets/img/Star_unselected.png"),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    margin: const EdgeInsets.only(top: 30),
                    child: Text(
                      "Оценка фильма поможет улучшить ваши рекомендации",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,

                      ),
                    )
                  ),
                ],
              ),
            ),


        ),
      ),
    );
  }
}