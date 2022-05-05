import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab2_flutter/test_main.dart';
import 'package:lab2_flutter/widgets/SideMenu.dart';
import 'package:lab2_flutter/widgets/card.dart';



class TestInfo extends StatelessWidget {

  TestInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      endDrawer: SideMenu(

      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(""),


        leading: Container(
          margin: new EdgeInsets.only(top: 5, bottom: 5, left: 20),
          child: GestureDetector(
            onTap: (){
              print('user clicked');
            },
            child: Image.asset("assets/img/Male_User.png",
                height: 40,
                width: 40,
                fit: BoxFit.contain
            ),
          ),
        ),
        actions: [
          Builder(
              builder: (BuildContext context){
                return Container(
                  margin: new EdgeInsets.only(top: 5, bottom: 5, right: 20),
                  child: GestureDetector(
                    onTap: (){
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: Image.asset("assets/img/Small_Logo.png",
                        height: 40,
                        width: 40,
                        fit: BoxFit.contain
                    ),
                  ),
                );
              }
          ),
        ],


      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const SizedBox(
                          width: 250,
                          child: Text(
                            'Тест Сонди',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          )
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            splashColor: Colors.transparent,
                            disabledColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: Image.asset(
                              "assets/img/Undo.png",
                              width: 60,
                              // height: 60,
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: RaisedButton(

                      color: Colors.white,
                      onPressed: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>TestPage(title: "", curPage: 1, matrix: [], curClickedData: {1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0},)));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 60,
                        child: Center(
                          child: Text(
                            "Начать тест!",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.black
                            ),
                          ),
                        ),
                      ),),
                  ),
                )
              ],
            ),
          ),
          Center(

            child: Container(
              margin: EdgeInsets.only(bottom: 100),
              height: 550,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 300,
                    margin: new EdgeInsets.only(top: 0),
                    child: Image.asset(
                      'assets/img/test_logo.png',
                      width: 300,
                      fit: BoxFit.fitWidth,
                    ),
                  ),

                  Container(
                    width: 300,
                    margin: new EdgeInsets.only(top: 10),
                    child: const Text(
                      'Немного информации',
                      style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 300,
                    margin: new EdgeInsets.only(top: 15),
                    child: const Text(
                      '    Мы используем абсттрактный тест чтобы получше узнать кто вы. Проходя его вы улучшаете точность ваших предсказаний.\n\n    На каждой стрранице теста выберете сначала пару самых приятных для вас лица, а затем пару лиц, которые вам не нравятся.\n\n    Если вы ошибетесь с выбором, вы сможете обновить страницу теста или запустить его заново.',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}