import 'package:cookingrecipe/AllRecipie.dart';
import 'package:cookingrecipe/Categories.dart';
import 'package:cookingrecipe/SignIn.dart';
import 'package:cookingrecipe/Today.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  String userName;
  String userEmail;

  _userData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String showuser = (sharedPreferences.getString('user') ?? null);
    var decodedUser = json.decode(showuser);
    userName = decodedUser["name"];
    userEmail = decodedUser["email"];
  }

  @override
  void initState() {
    this._userData();
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
      resizeToAvoidBottomPadding: false,
      backgroundColor: Hexcolor("#F3F5F9"),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 100.0,
                color: Hexcolor("#F3F5F9"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 35.0, left: 15.0, right: 15.0, bottom: 10.0),
                      color: Hexcolor("#F3F5F9"),
                      child: Material(
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(25.0),
                        child: TextFormField(
                          cursorColor: Hexcolor("#F3F5F9"),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Hexcolor("#F3F5F9"),
                            prefixIcon:
                                Icon(Icons.search, color: Hexcolor("#B3BFCE")),
                            contentPadding:
                                EdgeInsets.only(left: 15.0, top: 15.0),
                            hintText: 'Search for recipes...',
                            hintStyle: TextStyle(
                              color: Hexcolor("#B3BFCE"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showUserDialog(context);
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 35.0, right: 15.0, bottom: 10.0),
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/rafi.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          TabBar(
            labelColor: Hexcolor("#3B4263"),
            unselectedLabelColor: Hexcolor("#CEDCE4"),
            isScrollable: true,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 3.0, color: Hexcolor("#737A8F")),
                insets: EdgeInsets.symmetric(horizontal: 50.0)),
            controller: tabController,
            tabs: <Tab>[
              Tab(
                child: Text(
                  'ALL RECIPIE',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'TODAY',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'CATEGORIES',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height - 200.0,
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  AllRecipiePage(),
                  TodayPage(),
                  CategoriesPage()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> showUserDialog(context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            height: 300.0,
            width: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(height: 150.0),
                    Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          color: Hexcolor("#8B90F8")),
                    ),
                    Positioned(
                        top: 50.0,
                        left: 94.0,
                        child: Container(
                          height: 90.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45.0),
                            border: Border.all(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 2.0),
                            image: DecorationImage(
                                image: AssetImage('assets/images/rafi.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ))
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  userName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Hexcolor("#3B4260"),
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  userEmail,
                  style: TextStyle(
                      color: Hexcolor("#82959C"),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30.0),
                GestureDetector(
                  onTap: () async {
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.remove('token');
                    sharedPreferences.remove('user');
                    Route route =
                        MaterialPageRoute(builder: (context) => SignInPage());
                    Navigator.push(context, route);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Hexcolor("#F8332F"),
                            Hexcolor("#F564C0"),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Sign out",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
