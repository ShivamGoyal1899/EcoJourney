import 'package:flutter/material.dart';
import 'AuthenticationScreens/LoginScreen.dart';
import 'AuthenticationScreens/GoogleFacebookAuthMethods.dart';
import 'ProfileScreens/ProfileHomeScreen.dart';
import 'SafeMode/SafeModeScreen.dart';
import 'TravelFlowScreens/AutoRegistration.dart';
import 'TravelFlowScreens/TravelHomeScreen.dart';

class MyDrawer extends StatelessWidget {
  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("About EcoJourney"),
      content: Text(
          "This app is designed & developed by Team RuntimeTerror in NEC Hackathon: Transport held on 24th & 25th August 2019 in Gurugram, India."),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            accountName: Text(name),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
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
            title: Text("Profile & Settings"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ProfileHomeScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text("Redeem GreenPoints"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ProfileHomeScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text("Sixth Sense"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SafeModeScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Sign Out"),
            onTap: () {
              Navigator.pop(context);
              signOutGoogle();
              facebookLogin.logOut();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment_ind),
            title: Text("Rickshaw Registration"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AutoRegistration()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("About EcoJourney"),
            onTap: () {
              Navigator.pop(context);
              showAlertDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
