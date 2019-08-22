import 'package:flutter/material.dart';

import '../../main.dart';
import '../AppDrawer.dart';

class TravelDetailsSelectionScreen extends StatefulWidget {
  @override
  _TravelDetailsSelectionScreenState createState() =>
      _TravelDetailsSelectionScreenState();
}

class _TravelDetailsSelectionScreenState
    extends State<TravelDetailsSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
//        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: MyTitle(),
        iconTheme: new IconThemeData(color: Colors.black),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("426.0",
                    style: TextStyle(
                        color: Color(0xFF6ce75c),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700)),
                Text("Points",
                    style: TextStyle(color: Colors.black, fontSize: 12.0))
              ],
            ),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
