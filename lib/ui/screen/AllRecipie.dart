import 'dart:ui';
import 'package:cookingrecipe/ui/screen/RecipieDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class AllRecipiePage extends StatefulWidget {
  @override
  _AllRecipiePageState createState() => _AllRecipiePageState();
}

class _AllRecipiePageState extends State<AllRecipiePage> {
  List recipieModelList;
  var ingredientsData = [];
  var directionsData = [];
  String url = 'https://rcapp.utech.dev/api/recipes';

  allRecipie() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String showSharedPreferencesToken =
        (sharedPreferences.getString('token') ?? null);

    String bearerToken = "Bearer " + showSharedPreferencesToken;

    var response = await http.get(Uri.encodeFull(url),
        headers: {HttpHeaders.authorizationHeader: bearerToken});

    var jsonData = json.decode(response.body);
    setState(() {
      recipieModelList = jsonData["data"];
    });
  }

  @override
  void initState() {
    this.allRecipie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor("#F3F5F9"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 0.0),
          Expanded(
            child: ListView.builder(
              itemCount: recipieModelList == null ? 0 : recipieModelList.length,
              itemBuilder: (BuildContext context, int index) =>
                  recipieCard(context, index),
            ),
          ),
        ],
      ),
    );
  }

  Widget recipieCard(BuildContext context, int index) {
    final recipieList = recipieModelList[index];
    String title = recipieList["title"];
    String servings = recipieList["servings"].toString();
    int total_time = recipieList["total_time"];
    double totalTime = total_time / 60;
    int cook_time =
        recipieList["cook_time"] != null ? recipieList["cook_time"] : 0;
    String imageUrl = recipieList["image_url"];
    ingredientsData = recipieList["ingredients"].toList();
    directionsData = recipieList["directions"].toList();
    var sourceData = recipieList["source"];
    String sourceDataName = sourceData["name"];

    return Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              duration: Duration(milliseconds: 450),
              type: PageTransitionType.rightToLeftWithFade,
              child: RecipieDetailsPage(
                title,
                servings,
                totalTime,
                cook_time,
                imageUrl,
                ingredientsData,
                directionsData,
                sourceDataName,
              ),
            ),
          );
        },
        child: Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.fill),
                ),
                child: StreamBuilder<Object>(
                  stream: null,
                  builder: (context, snapshot) {
                    return Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.only(left: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Hexcolor("#3B4260"),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      sourceDataName,
                      style: TextStyle(
                        color: Hexcolor("#82959C"),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.favorite_border,
                          size: 18,
                          color: Hexcolor("#9EB2B5"),
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          cook_time.toString(),
                          style: TextStyle(
                            color: Hexcolor("#9EB2B5"),
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Icon(
                          Icons.access_time,
                          size: 18,
                          color: Hexcolor("#9EB2B5"),
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          totalTime.toString() + " hours",
                          style: TextStyle(
                            color: Hexcolor("#9EB2B5"),
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(width: 24.0),
                        Text(
                          servings + " servings",
                          style: TextStyle(
                            color: Hexcolor("#9EB2B5"),
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
