import '../TravelFlowScreens/TravelHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: MyTitle(),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 40.0),
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
            elevation: 4.0,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => TravelHomeScreen()),
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.google,
                    size: 18.0,
                    color: Colors.white,
                  ),
                  Text(
                    "  Sign In",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ],
              ),
            ),
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
