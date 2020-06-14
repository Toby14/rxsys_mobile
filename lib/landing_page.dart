import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  static const String id = "landing_page";
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff1a7d8f), Color(0xff93cad6)],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/logo_white.png"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Hello Landing Page",
                      style:
                      TextStyle(color: Color(0xff1a7d8f), fontSize: 24.0),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );;
  }
}
