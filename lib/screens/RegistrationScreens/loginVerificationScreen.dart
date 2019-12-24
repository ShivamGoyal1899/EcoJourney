import 'package:flutter/material.dart';

import '../../global.dart';
import '../DrawerScreens/navigationHomeScreen.dart';
import '../background.dart';
import 'registrationScreen.dart';

class LoginVerificationScreen extends StatefulWidget {
  @override
  _LoginVerificationScreenState createState() =>
      _LoginVerificationScreenState();
}

class _LoginVerificationScreenState extends State<LoginVerificationScreen> {
  @override
  void initState() {
    checkRegistrationStatus();
    navigateRegistration();
    super.initState();
  }

  navigateRegistration() async {
    await Future.delayed(const Duration(seconds: 5));
    registrationStatus == 'Registered'
        ? Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
            return NavigationHomeScreen();
          }))
        : Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
            return RegistrationScreen();
          }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Background(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/loading.gif'),
                Text(
                  'Planning your trip',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
