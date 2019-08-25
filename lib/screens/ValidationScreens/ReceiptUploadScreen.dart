import 'dart:io';

import 'package:EcoJourney/screens/AppDrawer.dart';
import 'package:EcoJourney/screens/ValidationScreens/ThankYouScreen.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
//import 'package:image_picker/image_picker.dart';

class ReceiptUploadScreen extends StatefulWidget {
  @override
  _ReceiptUploadScreenState createState() => _ReceiptUploadScreenState();
}

class _ReceiptUploadScreenState extends State<ReceiptUploadScreen> {
//  File image;
//
//  Camera_picker() async {
//    File img = await ImagePicker.pickImage(source: ImageSource.camera);
//    if (img != null) {
//      image = img;
//      setState(() {});
//    }
//  }
//
//  Gallery_picker() async {
//    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
//    if (img != null) {
//      image = img;
//      setState(() {});
//    }
//  }

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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              height: 350.0,
              child: new Center(
                child:  new Text(
                        "No image selected",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      )
              ),
            ),
            new Divider(
              height: 0.0,
            ),
            Container(
              height: 260.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    elevation: 4.0,
                    onPressed: () {
//                      Gallery_picker();
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
                            "  Pick Image",
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
                  SizedBox(height: 20.0),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    elevation: 4.0,
                    onPressed: () {
//                      Camera_picker();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.photo_camera,
                            size: 18.0,
                            color: Colors.white,
                          ),
                          Text(
                            "  Capture Photo",
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
                  SizedBox(height: 80.0),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    elevation: 4.0,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ThankYouScreen()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18.0,
                            color: Colors.white,
                          ),
                          Text(
                            "  Proceed",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    color: Color(0xFF6ce75c),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
