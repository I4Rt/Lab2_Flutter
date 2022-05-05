import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab2_flutter/films.dart';
import 'package:lab2_flutter/test_main.dart';
import 'package:lab2_flutter/widgets/SideMenu.dart';
import 'package:lab2_flutter/widgets/card.dart';



class TestResult extends StatelessWidget {

  TestResult({Key? key}) : super(key: key);

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
                    margin: new EdgeInsets.only(bottom: 25),
                    child: const Text(
                      'Ура! Все готово!',
                      style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 300,
                    margin: new EdgeInsets.only(top: 15, bottom: 15),
                    child: const Text(
                      '    Вы прошли тест и теперь наш сервис сможет понять какие фильмы вам по душе. Со временем ваши пердпочтения могут несколько меняться, это происходит по ряду причин, может у вас просто сменилось настроение или произошло какое-то значимое событие в жизни. В таком случа, если результаты нашей работы вас не устроят, пожалуйста пройдите тест еще раз и наслождайтесь качественными предсказаниями!\n\n    Вы можете помочь другим пользователям улучшить качества их предсказний, для этого после того, как просмотрите фильм, который мы вам посоветовали, оцените его! Вы сможете найти его во вкладке недавних рекомендаций или при поможи поиска.\n\n    P.S. Результаты теста никак нами не трактуются, поэтому вы можете не переживать за конфеденциальность данных.',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: RaisedButton(

                        color: Colors.white,
                        onPressed: (){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>Films()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width - 40,
                          height: 60,
                          child: Center(
                            child: Text(
                              "К рекомендациям!",
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
          ),
        ],
      ),
    );
  }
}