import 'package:EcoJourney/global.dart';
import 'package:EcoJourney/screens/DrawerScreens/navigationHomeScreen.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class ThankYouScreen extends StatefulWidget {
  @override
  _ThankYouScreenState createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  void initState() {
    // TODO: implement initState
    myReward = (int.parse(myReward) + 15).toString();
    updateReward(myReward);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "You have won 15 Green Points.",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 1.7,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        gradient: LinearGradient(
                            colors: signInGradients,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: Text("Go Home",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return NavigationHomeScreen();
                      }));
                    },
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
