import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';
import 'GoogleFacebookAuthMethods.dart';
import '../TravelFlowScreens/TravelHomeScreen.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 225.0,
              child: Image.asset("assets/images/ic_logo.png"),
            ),
            SizedBox(
              height: 125.0,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              elevation: 4.0,
              onPressed: () {
                signInWithGoogle().whenComplete(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return TravelHomeScreen();
                      },
                    ),
                  );
                });
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
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              elevation: 4.0,
              onPressed: () {
                initiateFacebookLogin().whenComplete(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return TravelHomeScreen();
                      },
                    ),
                  );
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.facebook,
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
              color: Colors.blue,
            ),
            SizedBox(
              height:10.0,
            ),
          ],
        ),
      ),
    );
  }
}
