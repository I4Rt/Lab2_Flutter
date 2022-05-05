import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../film_opened.dart';

class MyCard extends StatelessWidget {

  final Map<String, String> data;
  MyCard({required this.data, Key? key}) :
        _percent = double.parse(data["percent"]!),
        _rate = double.parse(data["rate"]!),
        _name = data["name"]!,
        _descript = data["descript"]!,
        super(key: key);
  late bool _makred = false;
  late double _percent = 91;
  late double _rate = 4.5;
  late String _name = "Мстители: Финал";
  late String _descript = "Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план чтобы восстановить свое доброе имя и воскресить человечество.";

  void _setMarked(Function() _setMarkedState) {
    _setMarkedState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FilmOpened(filmData: {"name": _name, "descript": _descript, "rate": _rate.toString(), "percent": _percent.toString()},
            cats: [
              {"name": "Экшен", "img": "assets/img/Action.png"},
              {"name": "Комедия", "img": "assets/img/Comedy.png"},
              {"name": "Фантастика", "img": "assets/img/Fantasy.png"},
              {"name": "Экшен", "img": "assets/img/Action.png"},
              {"name": "Комедия", "img": "assets/img/Comedy.png"},
              {"name": "Фантастика", "img": "assets/img/Fantasy.png"}
            ],
            same: [
              {"name": "Мстители: Финал", "descript": "Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план чтобы восстановить свое доброе имя и воскресить человечество.", "rate": "4.2", "percent": "33"},
              {"name": "Мстители: Финал", "descript": "Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план чтобы восстановить свое доброе имя и воскресить человечество.", "rate": "4.2", "percent": "33"},
              {"name": "Мстители: Финал", "descript": "Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план чтобы восстановить свое доброе имя и воскресить человечество.", "rate": "4.2", "percent": "33"},
              {"name": "Мстители: Финал", "descript": "Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план чтобы восстановить свое доброе имя и воскресить человечество.", "rate": "4.2", "percent": "33"}
            ],

          )),
        );
      },
      child: Container(
          margin: new EdgeInsets.all(10),
          height: 210,
          width: 150,
          color: Colors.black,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Image.asset(
                  'assets/img/Film_bg_opened.png',
                  height: 210,
                  width: 150,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                height: 210,
                width: 150,
                child: Column(
                  children: [
                    const Spacer(),
                    Image.asset(
                      'assets/img/bg_shade.png',
                      height: 140,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Container(
                height: 210,
                width: 150,
                padding: new EdgeInsets.all(5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(2)),
                              child: Container(
                                width: 42,
                                height: 16,
                                color: Color.fromRGBO(101, 174, 241, 1.0),
                                child: Center(
                                  child: Text(
                                    "$_percent%",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 12,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              margin: new EdgeInsets.only(top: 2),
                              width: 42,
                              height: 16,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 20,
                                    child: Text(
                                      "$_rate",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          fontSize: 12,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/img/Star_unselected.png',
                                    height: 12,
                                    width: 12,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ],
                              )
                            )
                          ],
                        ),
                        Spacer(),
                          Column(
                            children: [
                              Container(
                                height: 23,
                                width: 23,
                                margin: new EdgeInsets.only(bottom: 10),
                                child: IconButton(
                                  padding: new EdgeInsets.all(0),
                                  onPressed: () {print("wants to make marked");},
                                  icon: Image.asset(
                                    'assets/img/Bookmark.png',
                                    height: 23,
                                    width: 23,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      "$_name",
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white
                      ),
                    ),
                    Container(
                      height:70,
                      width: 140,
                      margin: const EdgeInsets.only(top: 5),
                      child: Text(
                        "$_descript",
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 12,
                            color: Colors.white
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}
