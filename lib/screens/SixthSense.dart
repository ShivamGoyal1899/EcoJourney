import 'dart:async';

import 'package:EcoJourney/screens/TravelFlowScreens/HomeScreen.dart';
import 'package:flutter/material.dart';

import '../global.dart';
import '../main.dart';

class SixthSense extends StatefulWidget {
  @override
  _SixthSenseState createState() => _SixthSenseState();
}

class _SixthSenseState extends State<SixthSense> {
  void _goToHomeScreen() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
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
      appBar: AppBar(
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
                Text(myReward,
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
        child: Center(
          child: Container(
            alignment: Alignment.center,
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                alignment: Alignment.center,
                child: Text(
                    "Press & hold your phone tight when you feel panic. Release to send inform your loved ones.",
                    style: TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.w700))),
          ),
        ),
      ),
    );
  }
}
