import 'package:cookingrecipe/Ingredients.dart';
import 'package:cookingrecipe/Preparations.dart';
import 'package:cookingrecipe/Reviews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share/share.dart';

class RecipieDetailsPage extends StatefulWidget {
  final String title;
  final String servings;
  final double totalTime;
  final int cook_time;
  final String imageUrl;
  final List ingredientsData;
  final List directionsData;
  final String sourceDataName;

  RecipieDetailsPage(
    this.title,
    this.servings,
    this.totalTime,
    this.cook_time,
    this.imageUrl,
    this.ingredientsData,
    this.directionsData,
    this.sourceDataName,
  );

  @override
  _RecipieDetailsPageState createState() => _RecipieDetailsPageState(
      title,
      servings,
      totalTime,
      cook_time,
      imageUrl,
      ingredientsData,
      directionsData,
      sourceDataName);
}

class _RecipieDetailsPageState extends State<RecipieDetailsPage>
    with SingleTickerProviderStateMixin {
  final String title;
  final String servings;
  final double totalTime;
  final int cook_time;
  final String imageUrl;
  final List ingredientsData;
  final List directionsData;
  final String sourceDataName;

  _RecipieDetailsPageState(
    this.title,
    this.servings,
    this.totalTime,
    this.cook_time,
    this.imageUrl,
    this.ingredientsData,
    this.directionsData,
    this.sourceDataName,
  );

  TabController tabController;

  bool alreadyAddedToFavourite = false;
  Color favouriteIconColor = Colors.white;

  _shareData() {
    final RenderBox renderBox = context.findRenderObject();
    Share.share(title,
        sharePositionOrigin:
            renderBox.localToGlobal(Offset.zero) & renderBox.size);
  }

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    widget.imageUrl,
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 400,
                    color: Colors.black12,
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  _shareData();
                                },
                                child: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (alreadyAddedToFavourite) {
                                      alreadyAddedToFavourite = false;
                                      favouriteIconColor = favouriteIconColor;
                                    } else {
                                      alreadyAddedToFavourite = true;
                                      favouriteIconColor = Hexcolor("#fe485a");
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.favorite_border,
                                  color: favouriteIconColor,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        SizedBox(height: 18),
                        Container(
                          padding: EdgeInsets.only(
                              top: 24.0, left: 24.0, right: 16.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          height: 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                title,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Hexcolor("#2D3867"),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.only(top: 5.0, left: 24.0, right: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            sourceDataName,
                            style: TextStyle(
                              color: Hexcolor("#82959C"),
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            children: <Widget>[
                              Icon(Icons.favorite_border,
                                  size: 18, color: Hexcolor("#9EB2B5")),
                              SizedBox(width: 4.0),
                              Text(
                                cook_time.toString(),
                                style: TextStyle(
                                  color: Hexcolor("#82959C"),
                                  fontSize: 14.0,
                                ),
                              ),
                              SizedBox(width: 16.0),
                              Icon(Icons.access_time,
                                  size: 18, color: Hexcolor("#9EB2B5")),
                              SizedBox(width: 4.0),
                              Text(
                                totalTime.toString() + " hours",
                                style: TextStyle(
                                  color: Hexcolor("#82959C"),
                                  fontSize: 14.0,
                                ),
                              ),
                              SizedBox(width: 24.0),
                              Text(
                                servings + " servings",
                                style: TextStyle(
                                  color: Hexcolor("#82959C"),
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                        ],
                      ),
                    ),
                    Divider(
                      color: Hexcolor("#82959C"),
                      thickness: 1.0,
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.remove,
                          size: 30,
                          color: Hexcolor("#82959C"),
                        ),
                        Image.asset(
                          'assets/images/multiple_user.png',
                          height: 40.0,
                          width: 40.0,
                          color: Hexcolor("#82959C"),
                        ),
                        Icon(
                          Icons.add,
                          size: 30,
                          color: Hexcolor("#82959C"),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Divider(
                      color: Hexcolor("#A1B0B6"),
                      thickness: 1.0,
                    ),
                    SizedBox(height: 10.0),
                    TabBar(
                      labelColor: Hexcolor("#3B4263"),
                      unselectedLabelColor: Hexcolor("#CEDCE4"),
                      isScrollable: true,
                      indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                              width: 3.0, color: Hexcolor("#737A8F")),
                          insets: EdgeInsets.symmetric(horizontal: 50.0)),
                      controller: tabController,
                      tabs: <Tab>[
                        Tab(
                          child: Text(
                            'Ingredients',
                            style: TextStyle(
                                fontSize: 17.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Preparations',
                            style: TextStyle(
                                fontSize: 17.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Reviews',
                            style: TextStyle(
                                fontSize: 17.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 190,
                      child: TabBarView(
                        controller: tabController,
                        children: <Widget>[
                          IngredientsPage(title, ingredientsData),
                          PreparationsPage(directionsData),
                          ReviewsPage()
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Divider(
                        color: Hexcolor("#A1B0B6"),
                        thickness: 1.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 16.0, right: 16.0, bottom: 24.0),
                      child: Text(
                        'Garlic Crusted Prime Rib Roast',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Hexcolor("#3B4260"),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
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
