import 'package:flutter/material.dart';
import '../../screens/AppBar/CustomAppBar.dart';

class LoginPageScreen extends StatefulWidget {
  @override
  _LoginPageScreenState createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "TITLE", subtitle: "SUBTITLE"),
      body: Container(),
    );
  }
}
