import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class ProfilePage extends StatefulWidget {
  static const String id = "profile_page";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 3.0, left: 20.0,),
            child: Row(
              children: <Widget>[
                Icon(Icons.person),
                SizedBox(
                  width: 25.0,
                ),
                Text("Guest"),
                SizedBox(
                  width: 170.0,
                ),
                Icon(Icons.add),
                Icon(Icons.add_alert),
              ],
            ),
          ),
          backgroundColor: Color(0xff1a7d8f),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff1a7d8f), Color(0xff93cad6)],
            )
          ),


        ),

      ),
    );
  }
}
//
//Card(
//margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
//child: ListTile(
//onTap: (){},
//leading: Icon(
//Icons.phone,
//color: Colors.blueGrey,
//size: 20.0,
//),
//title: Text(
//"+1 (407)666-7245",
//style: TextStyle(
//fontFamily: "Source Sans Pro",
//fontSize: 20.0,
//color: Colors.blueGrey),
//)),
//)