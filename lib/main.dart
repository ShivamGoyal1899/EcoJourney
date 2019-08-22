import 'screens/TravelFlowScreens/TravelHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'screens/AuthenticationScreens/LoginScreen.dart';
import 'screens/IntroScreens/IntroScreen.dart';
import 'screens/ProfileScreens/ProfileHomeScreen.dart';
import 'screens/SettingScreens/SettingHomeScreen.dart';

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
      home: IntroSliderScreen(),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            accountName: Text("Shivam Goyal"),
            accountEmail: Text("hi@shivamgoyal.co"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://avatars3.githubusercontent.com/u/25903939?s=400&v=4"),
              backgroundColor: Colors.transparent,
            ),
            otherAccountsPictures: <Widget>[],
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => TravelHomeScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Your Profile"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ProfileHomeScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Travel History"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text("Redeem GreenPoints"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("About Us"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsScreen()));
            },
          ),
        ],
      ),
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
