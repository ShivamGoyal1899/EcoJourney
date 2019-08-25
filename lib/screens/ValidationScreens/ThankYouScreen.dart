import 'package:EcoJourney/screens/AppDrawer.dart';
import 'package:flutter/material.dart';
import '../../main.dart';

class ThankYouScreen extends StatefulWidget {
  @override
  _ThankYouScreenState createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: MyTitle(),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Color(0xFF6ce75c),
              radius: 50.0,
              child: Icon(
                Icons.card_giftcard,
                color: Colors.white,
                size: 50.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text("Congratulations!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 10.0),
            Text(
              "You have won 462 Green Points.",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
