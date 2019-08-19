import 'package:flutter/material.dart';

AppBar getAppBar({String title, String subtitle}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    title: SafeArea(
      child: FittedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "$title",
              style: TextStyle(
                color: const Color(0xFF6ce75c),
                fontWeight: FontWeight.w700,
                fontSize: 28.0,
                letterSpacing: 3.0,
              ),
            ),
            Text(
              "$subtitle",
              style: TextStyle(
                color: const Color(0xFF383838),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
    actions: <Widget>[
      SizedBox(
        width: 20.0,
      ),
    ],
  );
}
