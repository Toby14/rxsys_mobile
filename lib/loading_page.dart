import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxsys_mobile/profile_page.dart';

class LoadingPage extends StatefulWidget {
  static const String id = "loading_page";

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState(){
    super.initState();

    Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, ProfilePage.id));

  }

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
                      "Rx",
                      style:
                          TextStyle(color: Color(0xff1a7d8f), fontSize: 24.0),
                    ),
                    Text(
                      "Sys.",
                      style: TextStyle(
                        color: Color(0xffff6858),
                        fontSize: 24.0
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
