import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class PreparationsPage extends StatefulWidget {
  final List directionsData;

  PreparationsPage(this.directionsData);

  @override
  _PreparationsPageState createState() =>
      _PreparationsPageState(directionsData);
}

class _PreparationsPageState extends State<PreparationsPage> {
  final List directionsData;

  _PreparationsPageState(this.directionsData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: directionsData == null ? 0 : directionsData.length,
        itemBuilder: (BuildContext context, int index) =>
            directionsCard(context, index),
      ),
    );
  }

  Widget directionsCard(BuildContext context, int index) {
    final directions = directionsData[index];
    String step_no = directions["step"].toString();
    String direction_details = directions["text"].toString();

    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Step " + step_no,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Hexcolor("#2D3867"),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              direction_details,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.justify,
              softWrap: true,
              style: TextStyle(
                color: Hexcolor("#82959C"),
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
