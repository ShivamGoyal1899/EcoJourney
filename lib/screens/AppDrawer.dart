import 'package:EcoJourney/screens/AuthenticationScreens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'AuthenticationScreens/GoogleAuthMethods.dart';
import 'ProfileScreens/ProfileHomeScreen.dart';
import 'SettingScreens/SettingHomeScreen.dart';
import 'TravelFlowScreens/TravelHomeScreen.dart';

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
            accountName: Text(name == null ? "Shivam Goyal" : name),
            accountEmail: Text(email == null ? "shivamgoyal.co" : email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl == null
                  ? "https://avatars3.githubusercontent.com/u/25903939?s=400&v=4"
                  : imageUrl),
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
            leading: Icon(Icons.exit_to_app),
            title: Text("Sign Out"),
            onTap: () {
              Navigator.pop(context);
              signOutGoogle();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ));
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
