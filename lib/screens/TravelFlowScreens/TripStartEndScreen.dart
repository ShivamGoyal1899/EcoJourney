import 'dart:convert';

import 'package:EcoJourney/models/transitModel.dart';
import 'package:EcoJourney/screens/ValidationScreens/ReceiptUploadScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

import '../../global.dart';
import '../../main.dart';

class TripStartEndScreen extends StatelessWidget {
  final String mode;
  final String fromLocation;
  final String toLocation;

  TripStartEndScreen({this.fromLocation, this.toLocation, this.mode});

  bool tripStarted = false;

  Future<Transit> getTransit() async {
    String url = 'https://maps.googleapis.com/maps/api/directions/json?origin=' +
        fromLocation +
        '&destination=' +
        toLocation +
        '&key=AIzaSyCE2MNtw8NvdeOJ62kqHq3LIqJnJlCR9kw&&mode=transit&transit_mode=' +
        mode;
    final response = await http.get(url);
    return Transit.fromJson(json.decode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: MyTitle(),
        iconTheme: new IconThemeData(color: Colors.black),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 15.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(myReward,
                    style: TextStyle(
                        color: Color(0xFF6ce75c),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700)),
                Text("Points",
                    style: TextStyle(color: Colors.black, fontSize: 12.0))
              ],
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getTransit(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.routes[0].legs[0].steps.length + 4,
              itemBuilder: (context, i) => i == 0
                  ? ListTile(
                      title: Text('From:'),
                      subtitle:
                          Text(snapshot.data.routes[0].legs[0].startAddress),
                    )
                  : i == 1
                      ? ListTile(
                          title: Text('To:'),
                          subtitle:
                              Text(snapshot.data.routes[0].legs[0].endAddress),
                        )
                      : i == 2
                          ? ListTile(
                              leading: IconButton(
                                icon: Icon(Icons.directions_subway),
                              ),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(snapshot.data.routes[0].legs[0]
                                          .departureTime.text +
                                      " - " +
                                      snapshot.data.routes[0].legs[0]
                                          .arrivalTime.text),
                                  Text(snapshot
                                      .data.routes[0].legs[0].duration.text),
                                ],
                              ),
                            )
                          : i > 2 &&
                                  i <
                                      snapshot.data.routes[0].legs[0].steps
                                              .length +
                                          3
                              ? ExpansionTile(
                                  title: Text(snapshot.data.routes[0].legs[0]
                                      .steps[i - 3].htmlInstructions),
                                  children: <Widget>[
                                    ListTile(
                                      title: Html(
                                          data: "- " +
                                              snapshot
                                                  .data
                                                  .routes[0]
                                                  .legs[0]
                                                  .steps[i - 3]
                                                  .htmlInstructions,
                                          defaultTextStyle:
                                              TextStyle(fontSize: 14.0)),
                                    ),
                                  ],
                                )
                              : Center(
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height: 20.0),
                                      GestureDetector(
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.7,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0)),
                                            gradient: LinearGradient(
                                                colors: signUpGradients,
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight),
                                          ),
                                          child: Text("Complete Journey",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)),
                                          padding: EdgeInsets.only(
                                              top: 16, bottom: 16),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder:
                                                  (BuildContext context) {
                                            return ReceiptUploadScreen();
                                          }));
                                        },
                                      ),
                                      SizedBox(height: 20.0),
                                    ],
                                  ),
                                ),
            );
          }
          return Center(child: Image.asset('assets/images/loading.gif'));
        },
      ),
    );
  }
}
