import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'screens/AuthenticationScreens/LoginScreen.dart';
import 'screens/IntroScreens/IntroScreen.dart';

void main() => runApp(EcoJourneyApp());

class EcoJourneyApp extends StatefulWidget {
  @override
  _EcoJourneyAppState createState() => _EcoJourneyAppState();
}

class _EcoJourneyAppState extends State<EcoJourneyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "EcoJourney",
      theme: ThemeData(fontFamily: "Quicksand"),
      debugShowCheckedModeBanner: false,
      home: IntroSliderScreen(),
    );
  }
}
