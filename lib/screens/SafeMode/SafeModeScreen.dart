import 'dart:async';
import 'package:EcoJourney/screens/AuthenticationScreens/LoginScreen.dart';
import 'package:EcoJourney/screens/TravelFlowScreens/TravelHomeScreen.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../AppDrawer.dart';

class SafeModeScreen extends StatefulWidget {
  @override
  _SafeModeScreenState createState() => _SafeModeScreenState();
}

class _SafeModeScreenState extends State<SafeModeScreen> {
  void _goToHomeScreen() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => TravelHomeScreen()));
  }

  Future<Timer> loadTimer() async {
    return Timer(Duration(seconds: 5), () {
      _goToHomeScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      appBar: AppBar(
//        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: MyTitle(),
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 15.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("426",
                    style: TextStyle(
                        color: Color(0xFF6ce75c),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700)),
                Text("Points",
                    style: TextStyle(color: Colors.black, fontSize: 12.0))
              ],
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onLongPressUp: loadTimer,
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
