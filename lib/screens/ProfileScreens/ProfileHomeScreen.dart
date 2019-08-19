import 'package:flutter/material.dart';
import '../../screens/AppBar/CustomAppBar.dart';

class ProfileHomePageScreen extends StatefulWidget {
  @override
  _ProfileHomePageScreenState createState() => _ProfileHomePageScreenState();
}

class _ProfileHomePageScreenState extends State<ProfileHomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "TITLE", subtitle: "SUBTITLE"),
      body: Container(),
    );
  }
}
