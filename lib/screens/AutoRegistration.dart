import 'package:flutter/material.dart';

import '../global.dart';
import '../main.dart';

class AutoRegistration extends StatefulWidget {
  @override
  _AutoRegistrationState createState() => _AutoRegistrationState();
}

class _AutoRegistrationState extends State<AutoRegistration> {
  FocusNode myFocusNode;

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
          Center(
            child: Container(
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
          )
        ],
      ),
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              SizedBox(height: 40.0),
              Text(
                "Auto Driver Portal",
                style: TextStyle(fontSize: 24.0),
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: "Full Name"),
              ),
              // The second text field is focused on when a user taps the
              // FloatingActionButton.
              TextField(
                  focusNode: myFocusNode,
                  decoration: InputDecoration(hintText: "Mobile Number")),
              TextField(
                  focusNode: myFocusNode,
                  decoration: InputDecoration(hintText: "City")),
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
//                      Navigator.of(context).push(MaterialPageRoute(
//                          builder: (BuildContext context) =>
//                              ReceiptUploadScreen()));
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
                            "  Join Us",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    color: Color(0xFF6ce75c),
                  ),
                ],
              ),
            ],
          )),
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
              style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 18.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
