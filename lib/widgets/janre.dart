import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../film_opened.dart';

class Janre extends StatelessWidget {

  final Map<String, Object> data;
  Janre({required this.data, Key? key}) :
        got_data = data,
        super(key: key);
  late var got_data;

  void _setMarked(Function() _setMarkedState) {
    _setMarkedState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: Container(
              width: 110,
              height: 60,
              color: Color.fromRGBO(132, 187, 217, 1.0),
              child: Image.asset(
                got_data["img"],
                fit: BoxFit.fitHeight,
                width: 110,
                height: 60,
              ),
            ),
          ),
          Container(
            width: 110,
            height: 60,
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                (got_data["name"]!).toString(),
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Colors.white
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
