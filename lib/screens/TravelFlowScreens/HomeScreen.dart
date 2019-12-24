import 'package:EcoJourney/screens/background.dart';
import 'package:EcoJourney/screens/voiceSearchDialog.dart';
import 'package:flutter/material.dart';

import '../../global.dart';
import '../../main.dart';
import 'TripStartEndScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final fromController = TextEditingController();
  final toController = TextEditingController();

  FocusNode toFocusNode;
  FocusNode fromFocusNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.blue,
        backgroundColor: Colors.white,
        elevation: 4.0,
        icon: Icon(
          Icons.mic_none,
          size: 25,
        ),
        label: Text(
          'VoiceSearch',
          style: TextStyle(fontSize: 16.0),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return VoiceSearch();
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: Stack(
        children: <Widget>[
          Background(),
          ListView(
            children: [
              SizedBox(height: 100),
              Padding(
                padding: EdgeInsets.only(right: 40, bottom: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  child: Material(
                    elevation: 8,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(30.0))),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 40, right: 20, top: 5, bottom: 5),
                      child: TextField(
                        controller: fromController,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        focusNode: fromFocusNode,
                        autofocus: false,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "From location",
                            hintStyle: TextStyle(
                                color: Color(0xFFA1A1A1),
                                fontSize: 22,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 40, bottom: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  child: Material(
                    elevation: 8,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(30.0))),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 40, right: 20, top: 5, bottom: 5),
                      child: TextField(
                        controller: toController,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        focusNode: toFocusNode,
                        autofocus: false,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "To location",
                            hintStyle: TextStyle(
                                color: Color(0xFFA1A1A1),
                                fontSize: 22,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(12.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: <Widget>[
                    ActionCard(
                      icon: Icons.directions_bus,
                      color: Colors.red,
                      title: "Bus",
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => TripStartEndScreen(
                                toLocation: toController.text,
                                fromLocation: fromController.text,
                                mode: 'bus')),
                      ),
                    ),
                    ActionCard(
                      icon: Icons.tram,
                      color: Colors.amber,
                      title: "Metro",
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => TripStartEndScreen(
                                toLocation: toController.text,
                                fromLocation: fromController.text,
                                mode: 'subway')),
                      ),
                    ),
                    ActionCard(
                      icon: Icons.local_taxi,
                      color: Colors.blue,
                      title: "Auto Rickshaw",
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                              title: Text(
                                'Coming Soon',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25.0),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    ActionCard(
                      icon: Icons.train,
                      color: Color(0xFF6ce75c),
                      title: "Train",
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => TripStartEndScreen(
                                toLocation: toController.text,
                                fromLocation: fromController.text,
                                mode: 'train')),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String title;
  final Color color;

  const ActionCard({Key key, this.onPressed, this.icon, this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: Ink(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: color,
              size: 32.0,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.title.copyWith(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
