import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab2_flutter/rate_screen.dart';
import 'package:lab2_flutter/widgets/SideMenu.dart';
import 'package:lab2_flutter/widgets/card.dart';
import 'package:lab2_flutter/widgets/janre.dart';



class FilmOpened extends StatelessWidget {
  Map<String, String> filmData = {"name": "Мстители: Финал", "descript": "Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план, который поможет противостоять разрушительным действиям могущественного титана Таноса. После наиболее масштабной и трагической битвы в истории они не могут допустить ошибку.", "rate": "4.2", "percent": "33"};
  List<Map<String, String>> cats = [
    {"name": "Action", "img": "assets/img/Action.png"},
    {"name": "Comedy", "img": "assets/img/Comedy.png"},
    {"name": "Fantasy", "img": "assets/img/Fantasy.png"}
  ];
  List<Map<String, String>> same = [
    {"name": "Мстители: Финал", "descript": "Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план, который поможет противостоять разрушительным действиям могущественного титана Таноса. После наиболее масштабной и трагической битвы в истории они не могут допустить ошибку.", "rate": "4.2", "percent": "33"},
    {"name": "Мстители: Финал", "descript": "Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план, который поможет противостоять разрушительным действиям могущественного титана Таноса. После наиболее масштабной и трагической битвы в истории они не могут допустить ошибку.", "rate": "4.2", "percent": "33"},
    {"name": "Мстители: Финал", "descript": "Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план, который поможет противостоять разрушительным действиям могущественного титана Таноса. После наиболее масштабной и трагической битвы в истории они не могут допустить ошибку.", "rate": "4.2", "percent": "33"},
    {"name": "Мстители: Финал", "descript": "Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план, который поможет противостоять разрушительным действиям могущественного титана Таноса. После наиболее масштабной и трагической битвы в истории они не могут допустить ошибку.", "rate": "4.2", "percent": "33"}
  ];


  FilmOpened({required this.filmData, required this.cats, required this.same, Key? key}) :
        filmData_got = filmData!,
        cats_got = cats,
        same_got = same,
        super(key: key);
  late Map<String, String> filmData_got;
  late List<Map<String, String>> same_got;
  late List<Map<String, String>> cats_got;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'assets/img/Film_bg_opened.png',
                          height: 350,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fitWidth,
                        ),
                        Container(
                          height: 350,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Spacer(),
                              Image.asset(
                                'assets/img/opened_shade.png',
                                height: 140,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ],

                          ),
                        ),
                        Container(
                          height: 350,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                          child: Column(
                            children: [
                              const Spacer(),
                              Center(
                                child: Text(
                                  filmData_got["name"]!,
                                  style: const TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                child: IconButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    icon: Image.asset(
                                        "assets/img/Undo.png",
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

                                    onPressed: (){},
                                    icon: Image.asset(
                                        "assets/img/Bookmark.png",
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                    )
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Этот фильм подходит вам на",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                  child: Container(
                                    width: 70,
                                    height: 30,
                                    color: const Color.fromRGBO(101, 174, 241, 1.0),
                                    child: Center(
                                      child: Text(
                                        (filmData_got["percent"]!).toString() + " %",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 16,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Средняя оценка пользователей",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        (filmData_got["rate"]!).toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 16,
                                            color: Colors.white
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        width: 22,
                                        height: 22,
                                        child: Image.asset(
                                          "assets/img/Star_unselected.png",
                                          width: 22,
                                          height: 22,
                                        )
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Жанры",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Colors.white
                                  ),
                                ),
                                Spacer()
                              ],
                            ),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width - 20,
                            margin: const EdgeInsets.only(top: 10),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: cats_got.map((i) => Janre(data: i)).toList(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Text(
                            "История",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white
                            ),
                          ),
                          Spacer()
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        filmData_got["descript"].toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: Colors.white
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Text(
                            "Связаные фильмы",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white
                            ),
                          ),
                          Spacer()
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 20,
                      margin: const EdgeInsets.only(top: 10, bottom: 90),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: same_got.map((i) => MyCard(data: i)).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Spacer(),
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        child: RaisedButton(

                          color: Colors.white,
                          onPressed: (){
                            String name = filmData_got["name"].toString();
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>RateFilm(data: name)));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 40,
                            height: 60,
                            child: Center(
                              child: Text(
                                "Оценить фильм",
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
              )
            ],
          )


      ),
    );
  }
}