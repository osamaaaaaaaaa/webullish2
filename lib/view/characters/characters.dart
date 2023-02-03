// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullishappnew/view/Home/Widgets/bottomnav_bar.dart';

import '../../apptheme.dart';
import 'charachterswidgets.dart';

class characters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Despicable Me Characters',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        canvasColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.white,
        ),
      ),
      home: CharacterListingScreen(),
    );
  }
}

class CharacterListingScreen extends StatefulWidget {
  @override
  _CharacterListingScreenState createState() => _CharacterListingScreenState();
}

class _CharacterListingScreenState extends State<CharacterListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottom_nav_bar(),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.all(20),
              height: 60,
              child: RichText(
                text: TextSpan(
                  children: const [
                    TextSpan(
                      text: "HOW ARE WE ?",
                      style: AppTheme.display1,
                    ),
                    TextSpan(text: "\n"),
                  ],
                ),
              ),
            ),
            CharacterWidget(),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(20),
              height: 90,
              child: RichText(
                text: TextSpan(
                  children: const [
                    TextSpan(
                      text: "Why webullish.com?",
                      style: AppTheme.display1,
                    ),
                  ],
                ),
              ),
            ),
            _widget(Icons.all_out, 'Easy To Follow',
                '''Our stock alerts are formatted in such a way that both new and experienced stock traders can greatly benefit from our research. Option traders also stand to benefit from our streamlined analyses.'''),
            _widget(Icons.assistant_outlined, 'Honest Analysis',
                '''We strive to be as transparent as possible with our findings, bringing you the most honest approach to trending stock movements. Every stock alert that we post is based upon in-depth research, and we would never inform anyone of a stock that we have not tirelessly looked into ourselves.'''),
            _widget(Icons.currency_bitcoin, 'Overall Accuracy',
                '''When trading, accuracy is crucial. Our alerts are only posted after we have had the chance to perform rigorous technical analyses and develop charts that offer helpful breakdowns of chosen stocks.'''),
            _widget(Icons.blur_linear_outlined, 'Reliability',
                '''Prior to releasing any information, each alert is verified for authenticity by our group of experts, ensuring that no information is too hastily published and can be trusted without a shadow of a doubt.'''),
            _widget(Icons.attach_money_outlined, 'Rapid Updates',
                '''Our experts are working around the clock to deliver stock alerts as quickly as possible. The quality of a stock can change at a moment’s notice, which is why being swift in providing our members with updates is of the utmost importance.'''),
            _widget(Icons.attractions, 'Unbeatable Value',
                '''Averaging over 100 well-researched stock alerts per month, members of webullish.com are only tasked with paying a sum that breaks down to \$1 a day. You would be hard-pressed to find such a profitable deal anywhere else!'''),
          ],
        ),
      ),
    );
  }
}

Widget _widget(IconData icon, title, substitle) => Container(
      width: Get.width,
      height: 300,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(color: Colors.white.withOpacity(0.5), blurRadius: 20)
          ],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            size: 50,
            color: Colors.amber,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              substitle,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
