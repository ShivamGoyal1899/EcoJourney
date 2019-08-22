import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../AppDrawer.dart';

class ProfileHomeScreen extends StatefulWidget {
  @override
  _ProfileHomeScreenState createState() => _ProfileHomeScreenState();
}

class _ProfileHomeScreenState extends State<ProfileHomeScreen> {
  bool _lights = true;
  bool _lights1 = false;

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
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            alignment: Alignment.center,
            child: CircleAvatar(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                  "https://avatars3.githubusercontent.com/u/25903939?s=400&v=4"),
              radius: 60.0,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "Shivam Goyal",
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 2.0),
                Text(
                  "hi@shivamgoyal.co",
                  style: TextStyle(fontSize: 16.0, color: Color(0xFF6ce75c)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
            title: Text(
              "GreenPoints Accumulated",
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "426.0",
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Color(0xFF6ce75c),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            onTap: () {},
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Divider(
              height: 0.0,
              color: Colors.black,
            ),
            padding: EdgeInsets.symmetric(horizontal: 25.0),
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
            title: Text(
              "Night Mode",
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
          Container(
            alignment: Alignment.centerRight,
            child: Divider(
              height: 0.0,
              color: Colors.black,
            ),
            padding: EdgeInsets.symmetric(horizontal: 25.0),
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
            title: Text(
              "Fingerprint Lock",
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            trailing: CupertinoSwitch(
              value: _lights1,
              onChanged: (bool value) {
                setState(() {
                  _lights1 = value;
                });
              },
            ),
            onTap: () {
              setState(() {
                _lights1 = !_lights1;
              });
            },
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Divider(
              height: 0.0,
              color: Colors.black,
            ),
            padding: EdgeInsets.symmetric(horizontal: 25.0),
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
            title: Text(
              "Language",
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "English",
                  style: TextStyle(fontSize: 16.0, color: Color(0xFF6ce75c)),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 16.0,
                  ),
                ),
              ],
            ),
            onTap: () {},
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Divider(
              height: 0.0,
              color: Colors.black,
            ),
            padding: EdgeInsets.symmetric(horizontal: 25.0),
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
            title: Text(
              "Base Currency",
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "INR",
                  style: TextStyle(fontSize: 16.0, color: Color(0xFF6ce75c)),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 16.0,
                  ),
                ),
              ],
            ),
            onTap: () {},
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Divider(
              height: 0.0,
              color: Colors.black,
            ),
            padding: EdgeInsets.symmetric(horizontal: 25.0),
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
            title: Text(
              "Data Recovery & Transfer",
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
