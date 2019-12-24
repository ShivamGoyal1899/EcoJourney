import 'package:flutter/material.dart';

import '../global.dart';
import '../main.dart';
import 'scratchCardDialog.dart';

class Rewardz extends StatefulWidget {
  @override
  _RewardzState createState() => _RewardzState();
}

class _RewardzState extends State<Rewardz> {
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
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  myReward,
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 2.0),
                Text(
                  'Total Green Points',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Divider(
            height: 0.0,
            color: Colors.black,
          ),
          SizedBox(height: 20.0),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 20.0,
              runSpacing: 20.0,
              children: <Widget>[
                ActionCard(
                  title: "You won",
                  subtitle: '15 Points',
                  onPressed: ScratchCard(),
                ),
                ActionCard(
                  title: "You won",
                  subtitle: '95 Points',
                  onPressed: ScratchCard(),
                ),
                ActionCard(
                  title: "You won",
                  subtitle: '56 Points',
                  onPressed: ScratchCard(),
                ),
                ActionCard(
                  title: "You won",
                  subtitle: '23 Points',
                  onPressed: ScratchCard(),
                ),
                ActionCard(
                  title: "You won",
                  subtitle: '45 Points',
                  onPressed: ScratchCard(),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
class ActionCard extends StatelessWidget {
  final Widget onPressed;
  final String title;
  final String subtitle;

  const ActionCard({Key key, this.onPressed, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return onPressed;
          },
        );
      },
      child: Ink(
        height: MediaQuery.of(context).size.width * 0.425,
        width: MediaQuery.of(context).size.width * 0.425,
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
            Container(
              width: 75.0,
              height: 75.0,
              child: Image.asset('assets/images/reward.png'),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.title.copyWith(
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.title.copyWith(
                fontSize: 22.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

