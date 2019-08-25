import 'package:EcoJourney/screens/TravelFlowScreens/TripStartEndScreen.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import '../../main.dart';
import '../AppDrawer.dart';
import 'package:flutter/cupertino.dart';

class TravelDetailsSelectionScreen extends StatefulWidget {
  @override
  _TravelDetailsSelectionScreenState createState() =>
      _TravelDetailsSelectionScreenState();
}

class _TravelDetailsSelectionScreenState
    extends State<TravelDetailsSelectionScreen> {
//  GlobalKey<AutoCompleteTextFieldState<Players>> key = GlobalKey();
//
//  AutoCompleteTextField searchTextField;
//
//  TextEditingController controller = TextEditingController();
//
//  _TravelDetailsSelectionScreenState();
//
//  void _loadData() async {
//    await PlayersViewModel.loadPlayers();
//  }
//
//  @override
//  void initState() {
//    _loadData();
//    super.initState();
//  }
  final _inputKey = GlobalKey(debugLabel: 'inputText');
  FocusNode myFocusNode;

  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  bool _lights = true;
  bool _lights1 = false;

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
//      body: Center(
//        child: Column(
//          children: <Widget>[
//            Column(
//              children: <Widget>[
//                searchTextField = AutoCompleteTextField<Players>(
//                  style: TextStyle(color: Colors.black, fontSize: 16.0),
//                  decoration: InputDecoration(
//                    prefixIcon: Icon(Icons.directions),
//                      suffixIcon: Container(
//                        width: 85.0,
//                        height: 60.0,
//                      ),
//                      contentPadding:
//                          EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
//                      filled: true,
//                      hintText: 'Search Metro Station',
//                      hintStyle: TextStyle(color: Colors.black)),
//                  itemSubmitted: (item) {
//                    setState(() => searchTextField.textField.controller.text =
//                        item.autocompleteterm);
//                  },
//                  clearOnSubmit: false,
//                  key: key,
//                  suggestions: PlayersViewModel.players,
//                  itemBuilder: (context, item) {
//                    return Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: Text(
//                        item.autocompleteterm,
//                        style: TextStyle(fontSize: 16.0),
//                      ),
//                    );
//                  },
//                  itemSorter: (a, b) {
//                    return a.autocompleteterm.compareTo(b.autocompleteterm);
//                  },
//                  itemFilter: (item, query) {
//                    return item.autocompleteterm
//                        .toLowerCase()
//                        .startsWith(query.toLowerCase());
//                  },
//                ),                searchTextField = AutoCompleteTextField<Players>(
//                  style: TextStyle(color: Colors.black, fontSize: 16.0),
//                  decoration: InputDecoration(
//                      prefixIcon: Icon(Icons.directions),
//                      suffixIcon: Container(
//                        width: 85.0,
//                        height: 60.0,
//                      ),
//                      contentPadding:
//                      EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
//                      filled: true,
//                      hintText: 'Search Metro Station',
//                      hintStyle: TextStyle(color: Colors.black)),
//                  itemSubmitted: (item) {
//                    setState(() => searchTextField.textField.controller.text =
//                        item.autocompleteterm);
//                  },
//                  clearOnSubmit: false,
//                  key: key,
//                  suggestions: PlayersViewModel.players,
//                  itemBuilder: (context, item) {
//                    return Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: Text(
//                        item.autocompleteterm,
//                        style: TextStyle(fontSize: 16.0),
//                      ),
//                    );
//                  },
//                  itemSorter: (a, b) {
//                    return a.autocompleteterm.compareTo(b.autocompleteterm);
//                  },
//                  itemFilter: (item, query) {
//                    return item.autocompleteterm
//                        .toLowerCase()
//                        .startsWith(query.toLowerCase());
//                  },
//                )
//              ],
//            ),
//          ],
//        ),
//      ),
//      body: ListView(
//        children: [
//          Padding(
//            padding: EdgeInsets.all(16.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.stretch,
//              children: [
//                TextField(
//                  key: _inputKey,
//                  style: Theme.of(context).textTheme.display1,
//                  decoration: InputDecoration(
//                    labelStyle: Theme.of(context).textTheme.display1,
//                    errorText: 'Invalid Station entered',
//                    labelText: 'From',
//                    border: OutlineInputBorder(
//                      borderRadius: BorderRadius.circular(5.0),
//                    ),
//                  ),
////                  keyboardType: TextInputType.number,
////                onChanged: _updateInputValue,
//                ),
////              _createDropdown(_fromValue.name, _updateFromConversion),
//              ],
//            ),
//          ),
//          SizedBox(height: 20.0),
//          Padding(
//            padding: EdgeInsets.all(16.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.stretch,
//              children: [
//                InputDecorator(
//                  child: Text(
//                    "New Delhi",
//                    style: Theme.of(context).textTheme.display1,
//                  ),
//                  decoration: InputDecoration(
//                    labelText: 'To',
//                    labelStyle: Theme.of(context).textTheme.display1,
//                    border: OutlineInputBorder(
//                      borderRadius: BorderRadius.circular(5.0),
//                    ),
//                  ),
//                ),
////                _createDropdown(_toValue.name, _updateToConversion),
//              ],
//            ),
//          ),
//        ],
//      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(children: [
              SizedBox(height: 20.0),
              TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: "From:"),
              ),
              TextField(
                  focusNode: myFocusNode,
                  decoration: InputDecoration(hintText: "To:")),
              SizedBox(height: 30.0),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                title: Text(
                  "Is this Your ofiice Adress?",
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
            ])),
      ),
    );
  }
}
