import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lab2_flutter/test_main.dart';
import 'package:lab2_flutter/test_prepare.dart';
import 'package:lab2_flutter/widgets/SideMenu.dart';
import 'package:lab2_flutter/widgets/card.dart';

import 'film_opened.dart';
import 'films.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "",),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Stack(
      children: <Widget>[
        Image.asset(
            'assets/img/main_bg.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
        ),
        Scaffold(
          endDrawer: SideMenu(

          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title),


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
          body: Center(

            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 300,
                  margin: new EdgeInsets.only(top: 0),
                  child: Image.asset(
                    'assets/img/main_logo.png',
                    width: 300,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                //MyCard(data: {"name": "Мстители: Финал", "descript": "Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план, который поможет противостоять разрушительным действиям могущественного титана Таноса. После наиболее масштабной и трагической битвы в истории они не могут допустить ошибку.", "rate": "4.2", "percent": "33"}),
                Container(
                  width: 350,
                  margin: new EdgeInsets.only(top: 25),
                  child: const Text(
                    'Точность ваших предсказаний',
                    style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.w400,
                      fontSize: 18
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 300,
                  margin: new EdgeInsets.only(top: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: LinearProgressIndicator(
                      value: 0.7,
                      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
                      color: Color.fromRGBO(70, 70, 70, 1),
                      minHeight: 25,
                    ),
                  ),
                ),
                Container(
                  width: 280,
                  height: 40,
                  margin: new EdgeInsets.only(top: 25),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Color.fromRGBO(101, 174, 241, 1),
                    child: Text("Пройти тестирование!",
                    style: TextStyle(fontSize: 22),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TestInfo()),
                      );
                    },
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  margin: new EdgeInsets.only(top: 15),
                  child: const Text(
                    'Мы пока что плохо вас знаем. Пойтите тестирование, чтобы улучшитьточность предсказаний',
                    style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
