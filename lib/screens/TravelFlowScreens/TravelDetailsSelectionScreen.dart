import 'dart:convert';
import 'package:EcoJourney/models/transitModel.dart';
import 'package:EcoJourney/screens/TravelFlowScreens/TripStartEndScreen.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import '../../main.dart';
import '../AppDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class TravelDetailsSelectionScreen extends StatefulWidget {
  @override
  _TravelDetailsSelectionScreenState createState() =>
      _TravelDetailsSelectionScreenState();
}

var fromLocation = " ";
var toLocation = " ";


class _TravelDetailsSelectionScreenState
    extends State<TravelDetailsSelectionScreen> {
  final fromController = TextEditingController();
  final toController = TextEditingController();

  final _inputKey = GlobalKey(debugLabel: 'inputText');
  FocusNode myFocusNode;

  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();
    fromController.dispose();
    toController.dispose();
    super.dispose();
  }

  bool _lights = true;
  bool monVal = false;
  bool tuVal = false;
  bool wedVal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      appBar: AppBar(
//        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: MyTitle(),
        iconTheme: IconThemeData(color: Colors.black),
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
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            SizedBox(height: 20.0),
            TextField(
              controller: fromController,
              textCapitalization: TextCapitalization.sentences,
              focusNode: myFocusNode,
              autofocus: true,
              obscureText: false,
              style: TextStyle(fontSize: 20.0),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "From",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0))),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: toController,
              textCapitalization: TextCapitalization.sentences,
              focusNode: myFocusNode,
              autofocus: true,
              obscureText: false,
              style: TextStyle(fontSize: 20.0),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "To",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0))),
            ),
            SizedBox(height: 30.0),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              title: Text(
                "Is this your Office Address ?",
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
              trailing: CupertinoSwitch(
                value: _lights,
                onChanged: (bool value) {
                  setState(() {
                    _lights = value;
                  });
                },
              ),
              onTap: () {
                setState(() {
                  _lights = !_lights;
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(height: 30),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  elevation: 4.0,
                  onPressed: () {
                    setState(() {
                      fromLocation = fromController.text;
                      toLocation = toController.text;
                    });
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => TripStartEndScreen()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.check_circle_outline,
                          size: 18.0,
                          color: Colors.white,
                        ),
                        Text(
                          "  View Route",
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
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class ApiResponse {
  Future<Transit> getTransit() async {
    String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin='+ fromLocation + '&destination='+ toLocation +'&key=AIzaSyBeV96xzMs51tMytAZgLZZDAAof9i_1kik&&mode=transit&transit_mode=subway';
    final response = await http.get(url);
    return Transit.fromJson(json.decode(response.body));
  }
}
