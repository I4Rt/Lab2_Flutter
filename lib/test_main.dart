import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lab2_flutter/test_prepare.dart';
import 'package:lab2_flutter/test_result.dart';
import 'package:lab2_flutter/widgets/SideMenu.dart';
import 'package:lab2_flutter/widgets/card.dart';

import 'film_opened.dart';
import 'films.dart';
import 'package:flip_card/flip_card.dart';

import 'main.dart';



class TestPage extends StatefulWidget {
  TestPage({Key? key, required this.title, required this.curPage, required this.curClickedData, required this.matrix}) : super(key: key);
  //const TestPage({Key? key, required this._curPage, required this.title}) : super(key: key);
  final String title;
  final int curPage;
  final Map<int, int> curClickedData;
  final List<Map<int, int>> matrix;

  
  @override
  State<TestPage> createState() => _TestPageState();
}


class _TestPageState extends State<TestPage> {
  
  late Image imageReject;
  late Image imageAccept;
  late List<Map<int, int>> _resultMatrix;

  late Map<int, int> _userClickedData = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0};
  late int _curPage = 1;

  int _clickCounter = 0;
  bool _isButtonVisible = false;


  @override
  void initState() {
    super.initState();

    imageReject = Image.asset(
        "assets/img/accept_card.png",
        height: 170,
        width: 124,
        fit: BoxFit.cover
    );
    imageAccept = Image.asset(
        "assets/img/reject_card.png",
        height: 170,
        width: 124,
        fit: BoxFit.cover
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(imageReject.image, context);
    precacheImage(imageAccept.image, context);
  }




  void _incrementClickCounter(){
   setState(() {
      _clickCounter += 1;
    });
  }
  void _addNextButton(){
   setState(() {
      _isButtonVisible = true;
    });
  }
  void _dropPage(){
   setState(() {
      _clickCounter = (_curPage - 1)* 4;
      displayWidget = _generatePage();

    });
  }

  void _nextPage(){
    setState(() {
      _resultMatrix.add(_userClickedData);
      _curPage += 1;


      Navigator.push(context,MaterialPageRoute(builder: (context) => TestPage(title: '', curPage:  _curPage ,matrix: _resultMatrix, curClickedData: {1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0}, )));
    });


  }


  void _setClicked(int position, int value) {
    print(_userClickedData);
    setState(() {
      _userClickedData[position] = value;
    });
  }
  /*
  append matrix with new row and set default row position for new lvl
   */
  void _addMatrixRow(){
   setState(() {
      _resultMatrix.add(_userClickedData);
    });
  }

  Widget displayWidget = Wrap();

  Widget _generatePage(){
    return Wrap(
        direction: Axis.horizontal,
        spacing: 8,
        runSpacing: 12,
        alignment: WrapAlignment.spaceBetween,

        children: _generateList()
    );
  }

  List<Widget> _generateList(){
    List<Widget> list = [];

    for (int i = (_curPage-1)*8 + 1; i <= (_curPage-1)*8 + 8; i++) {
      list.add(
          FlipCard(
            flipOnTouch: ((_curPage-1)*4 + _clickCounter < _curPage*4),
            direction: FlipDirection.VERTICAL,
            speed: 1000,
            onFlip: () {
              print("card clicked");

              if(_clickCounter < _curPage*4){
                _incrementClickCounter();
                _setClicked(i%8, (_clickCounter%4!=0) ? _clickCounter%4: 4);
                print("номер нажатия: " + _clickCounter.toString());
                print("массив результатов: " + _userClickedData.toString());
                if((_curPage-1)*4 + _clickCounter == _curPage*4){
                  print("event2");
                  _addNextButton();
                }
              }

            },
            front: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Image.asset("assets/img/"+ _curPage.toString() + "_" + (i%8 + 1).toString() + ".jpg",
                  height: 170,
                  width: 124,
                  fit: BoxFit.cover
              ),
            ),
            back: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: (_userClickedData[i] == null || _userClickedData[i]! < 3) ? Text(_userClickedData[i].toString(), style: TextStyle(
                color: Colors.white
              ),) : imageAccept ,
            ),
          )
      );
    }
    return list;
  }



  @override
  Widget build(BuildContext context) {
    print("New page, i got:");
    print(widget.curPage);
    print(widget.matrix);
   setState(() {

      _resultMatrix = widget.matrix;
      _curPage = widget.curPage;
      //_clickCounter = (_curPage - 1)* 4;
      _userClickedData = widget.curClickedData;
      displayWidget = _generatePage();
    });
   print(_userClickedData);

   if(_curPage == 7){
     print("сохранение");
     print(_resultMatrix);
     return TestResult();
   }

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      endDrawer: SideMenu(

      ),
      backgroundColor: Colors.black,
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
      body: Stack(
        children: [
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 35, right: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Страница $_curPage",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    )
                  ),
                  Container(

                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: IconButton(
                              onPressed: (){

                               setState(() {
                                  _dropPage();
                                });
                              },
                              icon: Image.asset(
                                "assets/img/refresh.png",
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              )
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          child: IconButton(

                              onPressed: (){
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "")));
                              },
                              icon: Image.asset(
                                "assets/img/Undo.png",
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )

          ),
          Center(

            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Container(
              margin: EdgeInsets.only(top: 90),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width - 100,
              child: displayWidget
            ),
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 800),
              child: _isButtonVisible ? Container(
              margin: EdgeInsets.only(top:90),
              height: MediaQuery.of(context).size.height-90,
              width: MediaQuery.of(context).size.width,
              color: Color.fromRGBO(0, 0, 0, 0.7),
              child: Center(
                child: Container(
                    margin: const EdgeInsets.all(20),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          _nextPage();
                        },
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width - 40,
                          height: 60,
                          child: Center(
                            child: Text(
                              "Далее",
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

              ),
            ) : Container(),
          )
        ],
      ),
    );
  }
}


