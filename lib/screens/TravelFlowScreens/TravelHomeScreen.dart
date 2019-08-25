import 'package:flutter/material.dart';
import '../../main.dart';
import '../AppDrawer.dart';
import 'TravelDetailsSelectionScreen.dart';
import 'TripStartEndScreen.dart';

class TravelHomeScreen extends StatefulWidget {
  @override
  _TravelHomeScreenState createState() => _TravelHomeScreenState();
}

class _TravelHomeScreenState extends State<TravelHomeScreen> {
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
      body: Container(
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
                    builder: (context) => TravelDetailsSelectionScreen()),
              ),
            ),
            ActionCard(
              icon: Icons.tram,
              color: Colors.amber,
              title: "Metro",
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => TravelDetailsSelectionScreen()),
              ),
            ),
            ActionCard(
              icon: Icons.airplanemode_active,
              color: Colors.purple,
              title: "Flight",
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => TravelDetailsSelectionScreen()),
              ),
            ),
            ActionCard(
              icon: Icons.train,
              color: Color(0xFF6ce75c),
              title: "Train",
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => TravelDetailsSelectionScreen()),
              ),
            ),
          ],
        ),
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
