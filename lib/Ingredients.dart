import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class IngredientsPage extends StatefulWidget {
  final String title;
  final List ingredientsData;

  IngredientsPage(this.title, this.ingredientsData);

  @override
  _IngredientsPageState createState() =>
      _IngredientsPageState(title, ingredientsData);
}

class _IngredientsPageState extends State<IngredientsPage> {
  final String title;
  final List ingredientsData;

  _IngredientsPageState(this.title, this.ingredientsData);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Hexcolor("#2D3867"),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ingredientsData == null ? 0 : ingredientsData.length,
              itemBuilder: (BuildContext context, int index) =>
                  ingredientsCard(context, index),
            ),
          ),
        ],
      ),
    );
  }

  Widget ingredientsCard(BuildContext context, int index) {
    final ingredientsList = ingredientsData[index];
    String name = ingredientsList["name"];

    String display_quantity = ingredientsList["display_quantity"];

    int quantity = int.parse(display_quantity);
    String spoon;
    var unitData = ingredientsList["unit"];
    String spoon_singular = unitData["name"];
    String spoon_plural = unitData["name_plural"];

    if (quantity > 1) {
      spoon = spoon_plural;
    } else {
      spoon = spoon_singular;
    }

    String preparation = ingredientsList["preparation"];
    String preparationIngrediants;
    if (preparation != null) {
      preparationIngrediants = preparation;
    } else {
      preparationIngrediants = "";
    }

    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 24, right: 16, bottom: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/dot.png',
                  width: 10,
                  height: 10,
                  color: Hexcolor("#82959C"),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    display_quantity.toString() + " " + spoon + " " + name,
                    style: TextStyle(
                      color: Hexcolor("#82959C"),
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
