import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab2_flutter/widgets/SideMenu.dart';
import 'package:lab2_flutter/widgets/card.dart';



class Films extends StatelessWidget {
  var temp_data = [
    {"name": "Мстители: Финал", "descript": "Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план, который поможет противостоять разрушительным действиям могущественного титана Таноса. После наиболее масштабной и трагической битвы в истории они не могут допустить ошибку.", "rate": "4.2", "percent": "33"},
    {"name": "Мстители: Финал", "descript": "Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план, который поможет противостоять разрушительным действиям могущественного титана Таноса. После наиболее масштабной и трагической битвы в истории они не могут допустить ошибку.", "rate": "4.2", "percent": "33"},
    {"name": "Мстители: Финал", "descript": "Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план, который поможет противостоять разрушительным действиям могущественного титана Таноса. После наиболее масштабной и трагической битвы в истории они не могут допустить ошибку.", "rate": "4.2", "percent": "33"},
    {"name": "Мстители: Финал", "descript": "Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план, который поможет противостоять разрушительным действиям могущественного титана Таноса. После наиболее масштабной и трагической битвы в истории они не могут допустить ошибку.", "rate": "4.2", "percent": "33"},
    {"name": "Мстители: Финал", "descript": "Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план, который поможет противостоять разрушительным действиям могущественного титана Таноса. После наиболее масштабной и трагической битвы в истории они не могут допустить ошибку.", "rate": "4.2", "percent": "33"},
    {"name": "Мстители: Финал", "descript": "Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план, который поможет противостоять разрушительным действиям могущественного титана Таноса. После наиболее масштабной и трагической битвы в истории они не могут допустить ошибку.", "rate": "4.2", "percent": "33"},
    {"name": "Мстители: Финал", "descript": "Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план, который поможет противостоять разрушительным действиям могущественного титана Таноса. После наиболее масштабной и трагической битвы в истории они не могут допустить ошибку.", "rate": "4.2", "percent": "33"}
  ];
  Films({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SideMenu(

      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.


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
      body: Container(
        padding: new EdgeInsets.only(left: 20, right: 20),
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Text(
                "Фильмы",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height - 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 8,
                      runSpacing: 12,
                      alignment: WrapAlignment.spaceBetween,

                      children: temp_data.map((i) => MyCard(data: i)).toList(),
                    ),
                  ),
                ),
              ),
            )
          ],
        )


        ),
    );
  }
}