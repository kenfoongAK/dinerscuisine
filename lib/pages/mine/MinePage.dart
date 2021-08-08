import 'package:demo2/pages/LoginPage.dart';
import 'package:demo2/pages/mine/AdminWebPage.dart';
import 'package:demo2/pages/mine/BeATeacherPage.dart';
import 'package:demo2/pages/mine/CreateCoursePage.dart';
import 'package:demo2/pages/mine/FeedbackPage.dart';
import 'package:demo2/pages/mine/HelpPage.dart';
import 'package:demo2/pages/mine/MyCoursePage.dart';
import 'package:demo2/pages/mine/ProfilePage.dart';
import 'package:demo2/pages/mine/SettingPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        appBar: AppBar(
          shadowColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 104, 47, 157),
          title: Text(
            'Me',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(children: <Widget>[
          Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              color: Colors.white,
              child: Row(
                children: [
                  Container(
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
                        "Mr zhang",
                        style: TextStyle(
                            color: Color.fromARGB(255, 104, 47, 157),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "hi every one",
                        style:
                            TextStyle(color: Color.fromARGB(255, 104, 47, 157)),
                      ),
                      Text(
                        "0 Following   0 Follower",
                        style:
                            TextStyle(color: Color.fromARGB(255, 104, 47, 157)),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Container(
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18),
                              bottomLeft: Radius.circular(18),
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
                        textColor: Colors.white,
                        child: Row(
                          children: [
                            Text("Profile  ",
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                            )
                          ],
                        )),
                  ),
                ],
              )),
          dinnerCenter(),
          row("Be a teacher", BeATeacherPage()),
          row("Feedback", FeedbackPage()),
          row("Help", HelpPage()),
          row("Setting", SettingPage()),
          row("Admin Web", AdminWebPage()),
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
                Text(title,
                    style: TextStyle(
                        color: Color.fromARGB(255, 104, 47, 157),
                        fontWeight: FontWeight.bold)),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
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
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child: Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  children: [
                    Text("Diners center",
                        style: TextStyle(
                            color: Color.fromARGB(255, 104, 47, 157),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Expanded(child: Container()),
                    Text(
                      "All",
                      style: TextStyle(fontSize: 13),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 13,
                    ),
                  ],
                ))),
        Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 20),
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
                            ),
                            Text("Create course"),
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
                            ),
                            Text("My course"),
                          ],
                        ))),
              ],
            ))
      ],
    );
  }
}
