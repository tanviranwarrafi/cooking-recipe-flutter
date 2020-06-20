import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ReviewsPage extends StatefulWidget {
  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  double _ratingSmile = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '4.5',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4.0),
                  Icon(
                    Icons.star,
                    size: 32,
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: .5),
                                  child: Text(
                                    '5',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                SizedBox(width: 4.0),
                                Icon(Icons.star, size: 20),
                                SizedBox(width: 4.0),
                                LinearPercentIndicator(
                                  width: 180.0,
                                  animation: true,
                                  lineHeight: 8.0,
                                  animationDuration: 2500,
                                  percent: 0.8,
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.green,
                                ),
                              ],
                            ),
                            SizedBox(height: 2.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: .5),
                                  child: Text(
                                    '4',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                SizedBox(width: 4.0),
                                Icon(Icons.star, size: 20),
                                SizedBox(width: 4.0),
                                LinearPercentIndicator(
                                  width: 180.0,
                                  animation: true,
                                  lineHeight: 8.0,
                                  animationDuration: 2500,
                                  percent: 0.5,
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.blue,
                                ),
                              ],
                            ),
                            SizedBox(height: 2.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: .5),
                                  child: Text(
                                    '3',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                SizedBox(width: 4.0),
                                Icon(Icons.star, size: 20),
                                SizedBox(width: 4.0),
                                LinearPercentIndicator(
                                  width: 180.0,
                                  animation: true,
                                  lineHeight: 7.0,
                                  animationDuration: 2500,
                                  percent: 0.6,
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.orange,
                                ),
                              ],
                            ),
                            SizedBox(height: 2.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: .5),
                                  child: Text(
                                    '2',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                SizedBox(width: 4.0),
                                Icon(Icons.star, size: 20),
                                SizedBox(width: 4.0),
                                LinearPercentIndicator(
                                  width: 180.0,
                                  animation: true,
                                  lineHeight: 8.0,
                                  animationDuration: 2500,
                                  percent: 0.8,
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.yellow,
                                ),
                              ],
                            ),
                            SizedBox(height: 2.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: .5),
                                  child: Text(
                                    '1',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                SizedBox(width: 4.0),
                                Icon(Icons.star, size: 20),
                                SizedBox(width: 4.0),
                                LinearPercentIndicator(
                                  width: 180.0,
                                  animation: true,
                                  lineHeight: 8.0,
                                  animationDuration: 2500,
                                  percent: 0.4,
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.green,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text('10'),
                            SizedBox(height: 6.0),
                            Text('10'),
                            SizedBox(height: 6.0),
                            Text('10'),
                            SizedBox(height: 6.0),
                            Text('10'),
                            SizedBox(height: 6.0),
                            Text('10'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'Your Ratings',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Hexcolor("#3B4260"),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              RatingBar(
                onRatingChanged: (rating) =>
                    setState(() => _ratingSmile = rating),
                filledIcon: Icons.sentiment_satisfied,
                emptyIcon: Icons.sentiment_dissatisfied,
                halfFilledIcon: Icons.sentiment_neutral,
                isHalfAllowed: true,
                initialRating: 3,
                filledColor: Colors.green,
                emptyColor: Colors.redAccent,
                halfFilledColor: Colors.amberAccent,
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
