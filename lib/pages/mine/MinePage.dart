import 'dart:convert';

import 'package:demo2/pages/LoginPage.dart';
import 'package:demo2/pages/mine/AdminWebPage.dart';
import 'package:demo2/pages/mine/BeATeacherPage.dart';
import 'package:demo2/pages/mine/CreateCoursePage.dart';
import 'package:demo2/pages/mine/DinnerCenterPage.dart';
import 'package:demo2/pages/mine/FeedbackPage.dart';
import 'package:demo2/pages/mine/HelpPage.dart';
import 'package:demo2/pages/mine/MyCoursePage.dart';
import 'package:demo2/pages/mine/ProfilePage.dart';
import 'package:demo2/pages/mine/SettingPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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

  @override
  void initState() {
    super.initState();
    getMe();
  }

  String fullname = "Loading......";
  String introduction = "hi everyone";
  int comid = 1;

  Future<void> getMe() async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = http.Request(
        'POST', Uri.parse('https://app.shanghai168.com/api/user/'));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    request.bodyFields = {'id': prefs.getInt("id").toString()};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final result = await json.decode(await response.stream.bytesToString());
      setState(() {
        fullname = result['data'][0]['username'];
        comid = result['data'][1]['id'];
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
        // appBar: AppBar(
        //   shadowColor: Colors.white,
        //   backgroundColor: Color.fromARGB(255, 104, 47, 157),
        //   title: Text(
        //     'Me',
        //     style: TextStyle(color: Colors.white),
        //   ),
        // ),
        body: ListView(children: <Widget>[
      Container(
          alignment: Alignment.center,
          color: Color.fromARGB(255, 104, 47, 157),
          height: 80,
          child: Text(
            'Me',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          )),
      Container(
          color: Color.fromARGB(255, 104, 47, 157),
          child: Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.5),
                    topRight: const Radius.circular(10.5),
                  )),
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Row(
                children: [
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(10),
                    child: Icon(
                      Icons.account_circle_outlined,
                      size: 50,
                      color: Color.fromARGB(255, 104, 47, 157),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fullname,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        introduction,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "0 Following   0 Follower",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Container(
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              topRight: Radius.zero,
                              bottomRight: Radius.zero),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()));
                        },
                        padding: EdgeInsets.all(15.0),
                        color: Colors.red[400],
                        textColor: Colors.grey,
                        child: Row(
                          children: [
                            Text("Profile  ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                )),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 12,
                            )
                          ],
                        )),
                  ),
                ],
              ))),
      comid == 1 ? row("Be a teacher", BeATeacherPage()) : dinnerCenter(),
      row("Feedback", FeedbackPage()),
      row("Help", HelpPage()),
      row("Setting", SettingPage()),
      // row("Admin Web", AdminWebPage()),
      row("Logout", LoginPage(), logout: true),
    ]));
  }

  Widget row(title, page, {logout = false}) {
    return InkWell(
        onTap: () async {
          if (logout) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.clear();
          }
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        child: Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              children: [
                Text(title, style: TextStyle(color: Colors.grey)),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                  color: Colors.white,
                ),
              ],
            )));
  }

  Widget dinnerCenter() {
    return Column(
      children: [
        InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DinnerCenterPage()));
            },
            child: Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  children: [
                    Text("Diners center",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        )),
                    Expanded(child: Container()),
                    Text(
                      "All",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 13,
                    ),
                  ],
                ))),
        Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateCoursePage()));
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              size: 30,
                              color: Colors.grey,
                            ),
                            Text("Create course",
                                style: TextStyle(
                                  color: Colors.grey,
                                )),
                          ],
                        ))),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyCoursePage()));
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Icon(
                              Icons.ondemand_video,
                              size: 30,
                              color: Colors.grey,
                            ),
                            Text(
                              "My course",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ))),
              ],
            ))
      ],
    );
  }
}
