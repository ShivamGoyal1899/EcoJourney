import 'package:EcoJourney/models/transitModel.dart';
import 'package:EcoJourney/screens/ValidationScreens/ReceiptUploadScreen.dart';
import 'package:EcoJourney/screens/ValidationScreens/ThankYouScreen.dart';
import 'package:EcoJourney/services/transitServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';
import '../AppDrawer.dart';
import 'TravelDetailsSelectionScreen.dart';

class TripStartEndScreen extends StatefulWidget {
  @override
  _TripStartEndScreenState createState() => _TripStartEndScreenState();
}

class _TripStartEndScreenState extends State<TripStartEndScreen> {
  ApiResponse api = ApiResponse();

  bool tripStarted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
//        automaticallyImplyLeading: false,
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
                Text("426",
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
      body: FutureBuilder<Transit>(
        future: api.getTransit(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            snapshot.data.routes[0].legs[0].startAddress +
                                " - " +
                                snapshot.data.routes[0].legs[0].endAddress),
                      ),
                      ListTile(
                        leading: Icon(Icons.directions_subway),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(snapshot
                                .data.routes[0].legs[0].departureTime.text +
                                " - " +
                                snapshot
                                    .data.routes[0].legs[0].arrivalTime.text),
                            Text(snapshot.data.routes[0].legs[0].duration.text),
                          ],
                        ),
                        subtitle: Html(
                            data: snapshot.data.routes[0].legs[0].steps[0]
                                .htmlInstructions),
                      ),
                      ExpansionTile(
                        title: Text(snapshot
                            .data.routes[0].legs[0].steps[0].htmlInstructions),
                        children: <Widget>[
                          ListTile(
                            title: Html(
                                data: "- " +
                                    snapshot.data.routes[0].legs[0].steps[0]
                                        .steps[0].htmlInstructions,
                                defaultTextStyle: TextStyle(fontSize: 14.0)),
                          ),
                          ListTile(
                            title: Html(
                                data: "- " +
                                    snapshot.data.routes[0].legs[0].steps[0]
                                        .steps[1].htmlInstructions,
                                defaultTextStyle: TextStyle(fontSize: 14.0)),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: Text(snapshot
                            .data.routes[0].legs[0].steps[1].htmlInstructions),
                        children: <Widget>[
                          ListTile(
                            title: Html(
                                data: "- " +
                                    snapshot.data.routes[0].legs[0].steps[0]
                                        .steps[0].htmlInstructions,
                                defaultTextStyle: TextStyle(fontSize: 14.0)),
                          ),
                          ListTile(
                            title: Html(
                                data: "- " +
                                    snapshot.data.routes[0].legs[0].steps[0]
                                        .steps[1].htmlInstructions,
                                defaultTextStyle: TextStyle(fontSize: 14.0)),
                          ),
                        ],
                      ), ExpansionTile(
                        title: Text(snapshot
                            .data.routes[0].legs[0].steps[2].htmlInstructions),
                        children: <Widget>[
                          ListTile(
                            title: Html(
                                data: "- " +
                                    snapshot.data.routes[0].legs[0].steps[0]
                                        .steps[0].htmlInstructions,
                                defaultTextStyle: TextStyle(fontSize: 14.0)),
                          ),
                          ListTile(
                            title: Html(
                                data: "- " +
                                    snapshot.data.routes[0].legs[0].steps[0]
                                        .steps[1].htmlInstructions,
                                defaultTextStyle: TextStyle(fontSize: 14.0)),
                          ),
                        ],
                      ), ExpansionTile(
                        title: Text(snapshot
                            .data.routes[0].legs[0].steps[3].htmlInstructions),
                        children: <Widget>[
                          ListTile(
                            title: Html(
                                data: "- " +
                                    snapshot.data.routes[0].legs[0].steps[0]
                                        .steps[0].htmlInstructions,
                                defaultTextStyle: TextStyle(fontSize: 14.0)),
                          ),
                          ListTile(
                            title: Html(
                                data: "- " +
                                    snapshot.data.routes[0].legs[0].steps[0]
                                        .steps[1].htmlInstructions,
                                defaultTextStyle: TextStyle(fontSize: 14.0)),
                          ),
                        ],
                      ),                      ExpansionTile(
                        title: Text(snapshot
                            .data.routes[0].legs[0].steps[4].htmlInstructions),
                        children: <Widget>[
                          ListTile(
                            title: Html(
                                data: "- " +
                                    snapshot.data.routes[0].legs[0].steps[0]
                                        .steps[0].htmlInstructions,
                                defaultTextStyle: TextStyle(fontSize: 14.0)),
                          ),
                          ListTile(
                            title: Html(
                                data: "- " +
                                    snapshot.data.routes[0].legs[0].steps[0]
                                        .steps[1].htmlInstructions,
                                defaultTextStyle: TextStyle(fontSize: 14.0)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          elevation: 4.0,
                          onPressed: () {
                            tripStarted == true
                                ? Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ReceiptUploadScreen()),
                            )
                                : null;
                            setState(() {
                              tripStarted == false
                                  ? tripStarted = true
                                  : tripStarted = false;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  tripStarted == false
                                      ? Icons.flight_takeoff
                                      : Icons.flight_land,
                                  size: 18.0,
                                  color: Colors.white,
                                ),
                                Text(
                                  tripStarted == false
                                      ? "  Start Trip"
                                      : "  End Trip",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          ),
                          color:
                          tripStarted == false ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(backgroundColor: Colors.black));
        },
      ),
    );
  }
}
