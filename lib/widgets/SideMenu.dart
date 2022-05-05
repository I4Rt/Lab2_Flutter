import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lab2_flutter/films.dart';

import '../main.dart';
import '../test_prepare.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width/5*2,
      child: Drawer(

        backgroundColor: Color.fromRGBO(0, 0, 0, 0.7),
        elevation: 16.0,
        child: Container(
          margin: EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: <Widget>[
              Container(
                height: 60,
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide( //                    <--- top side
                        color: Colors.white,
                        width: 2.0,
                      ),                  )
                ),

                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(

                      children: [
                        Column(
                          children: [
                            Spacer(),
                            Text(
                              "MENU",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Image.asset("assets/img/Small_Logo.png",
                            height: 40,
                            fit: BoxFit.fitHeight
                        )
                      ],
                    ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/5*2,
                
                child: RaisedButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Films()),
                    );
                  },
                  color: Colors.transparent,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      "Рекомендации",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white
                      ),
                    ),
                  )
                ),
              ),

              Container(
                  width: MediaQuery.of(context).size.width/5*2,
                  
                  child: RaisedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TestInfo()),
                        );
                      },
                      color: Colors.transparent,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: const Text(
                          "Тест",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.white
                          ),
                        ),
                      )
                  )
              ),
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width/5*2,
                margin: const EdgeInsets.only(bottom: 10),
                child: RaisedButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage(title: '',)),
                    );
                  },
                  color: Colors.transparent,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: const Text("На главную",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  )
                ),
              ),

            ]
          ),
        ),
      ),
    );
  }
}

                  /*
              UserAccountsDrawerHeader(
                accountName: Text(""),
                accountEmail: Text(""),
                currentAccountPicture: Padding(
                  padding: const EdgeInsets.only(top:15),
                  child: Text(
                      "MENU",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                      ),
                  ),
                ),
                otherAccountsPictures: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset("assets/img/Small_Logo.png",
                    height: 40,
                    fit: BoxFit.fitHeight),
                  )
                ],
              ),
            ),
            ListTile(
              title: new Text("All Inboxes"),
              leading: new Icon(Icons.mail),
            ),
          ],

                   */


