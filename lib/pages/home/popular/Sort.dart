import 'package:demo2/pages/home/popular/Sort/ChinesePage.dart';
import 'package:demo2/pages/home/popular/Sort/FrenchPage.dart';
import 'package:demo2/pages/home/popular/Sort/ItalianPage.dart';
import 'package:demo2/pages/home/popular/Sort/JapanesePage.dart';
import 'package:flutter/material.dart';

class SortPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<SortPage> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    /*24 is for notification bar on Android*/
    return new Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color.fromARGB(255, 104, 47, 157),
        //   title: Text(
        //     'All Course',
        //     style: TextStyle(color: Colors.white),
        //   ),
        // ),
        body: Container(
            alignment: Alignment.center,
            color: Color.fromARGB(255, 104, 47, 157),
            child: ListView(children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    "\n\nAll Course",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                  margin: EdgeInsets.all(20),
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0),
                        bottomLeft: const Radius.circular(20.0),
                        bottomRight: const Radius.circular(20.0),
                      )),
                  child: Column(children: <Widget>[
                    Text(
                      "\nClassification",
                      style: TextStyle(
                          color: Color.fromARGB(255, 104, 47, 157),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    row("French", FrenchPage()),
                    row("Italian", ItalianPage()),
                    row("Japanese", JapanesePage()),
                    row("Chinese", ChinesePage()),
                  ]))
            ])));
  }

  Widget row(title, page) {
    return Container(
        width: 200,
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => page));
            },
            child: Align(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  decoration: new BoxDecoration(
                      color: Color.fromARGB(255, 104, 47, 157),
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(100.0),
                        topRight: const Radius.circular(100.0),
                        bottomLeft: const Radius.circular(100.0),
                        bottomRight: const Radius.circular(100.0),
                      )),
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(title,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ))));
  }
}
