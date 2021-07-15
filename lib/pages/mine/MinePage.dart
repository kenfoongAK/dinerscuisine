import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
        body: ListView(children: <Widget>[
      Container(
        margin: EdgeInsets.all(10),
        height: 50.0,
        child: RaisedButton(
          onPressed: () {},
          padding: EdgeInsets.all(10.0),
          color: Colors.transparent,
          textColor: Colors.black,
          child: Text("Feedback", style: TextStyle(fontSize: 15)),
        ),
      ),
      Container(
        margin: EdgeInsets.all(10),
        height: 50.0,
        child: RaisedButton(
          onPressed: () {},
          padding: EdgeInsets.all(10.0),
          color: Colors.transparent,
          textColor: Colors.black,
          child: Text("Help", style: TextStyle(fontSize: 15)),
        ),
      ),
      Container(
        margin: EdgeInsets.all(10),
        height: 50.0,
        child: RaisedButton(
          onPressed: () {},
          padding: EdgeInsets.all(10.0),
          color: Colors.transparent,
          textColor: Colors.black,
          child: Text("Set up", style: TextStyle(fontSize: 15)),
        ),
      ),
    ]));
  }
}
