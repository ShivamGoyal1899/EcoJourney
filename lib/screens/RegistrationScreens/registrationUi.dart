import 'package:EcoJourney/screens/IntroScreen.dart';
import 'package:flutter/material.dart';

import '../../global.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  FocusNode nameFocusNode;
  FocusNode mobileNumberFocusNode;
  FocusNode emailFocusNode;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 50.0),
        Image.asset(
          'assets/images/ic_logo.png',
          width: 200,
          height: 200,
        ),
        SizedBox(height: 50.0),
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
                padding:
                    EdgeInsets.only(left: 40, right: 20, top: 5, bottom: 5),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  focusNode: nameFocusNode,
                  autofocus: false,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Name",
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
                padding:
                    EdgeInsets.only(left: 40, right: 20, top: 5, bottom: 5),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  focusNode: emailFocusNode,
                  autofocus: false,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
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
        Center(
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.7,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                gradient: LinearGradient(
                    colors: signUpGradients,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: Text("Complete Registration",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 16, bottom: 16),
            ),
            onTap: () {
              registerUser(
                  nameController.value.text, emailController.value.text);
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) {
                return IntroSliderScreen();
              }));
            },
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}

const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

const List<Color> signUpGradients = [
  Color(0xFFFF9945),
  Color(0xFFFc6076),
];
