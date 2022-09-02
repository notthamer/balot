import 'package:flutter/material.dart';

class TeamTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          'لهم',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Almarai",
            decoration: TextDecoration.none,
            fontSize: 30,
            color: Colors.lightGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'لنا',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Almarai",
            decoration: TextDecoration.none,
            fontSize: 30,
            color: Colors.lightGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}