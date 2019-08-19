import 'package:flutter/material.dart';
import '../../screens/AppBar/CustomAppBar.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "TITLE", subtitle: "SUBTITLE"),
      body: Container(),
    );
  }
}
