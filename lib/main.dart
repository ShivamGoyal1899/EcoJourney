import 'package:EcoJourney/screens/RegistrationScreens/loginVerificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(EcoJourneyApp());
}

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
      home: LoginVerificationScreen(),
    );
  }
}

class MyTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Eco",
          style: TextStyle(
            color: const Color(0xFF6ce75c),
            fontWeight: FontWeight.w700,
            fontSize: 28.0,
            letterSpacing: 3.0,
          ),
        ),
        Text(
          "Journey",
          style: TextStyle(
            color: const Color(0xFF383838),
            fontWeight: FontWeight.w700,
            fontSize: 28.0,
            letterSpacing: 3.0,
          ),
        ),
      ],
    );
  }
}
