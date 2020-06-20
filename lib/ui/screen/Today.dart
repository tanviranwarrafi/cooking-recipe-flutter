import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class TodayPage extends StatefulWidget {
  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.insert_emoticon,
            size: 40,
            color: Hexcolor("#F8C260"),
          ),
          SizedBox(
            height: 4.0,
          ),
          Center(
            child: Text(
              'This page is under construction',
              style: TextStyle(
                fontSize: 20.0,
                color: Hexcolor("#F8C260"),
                fontWeight: FontWeight.bold,
              ),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
