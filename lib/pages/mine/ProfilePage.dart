import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    /*24 is for notification bar on Android*/
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 104, 47, 157),
          shadowColor: Colors.white,
          title: Text(
            'Edit profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: <Widget>[
            InkWell(
                onTap: () async {
                  // Navigator.push(
                  // context, MaterialPageRoute(builder: (context) => page));
                },
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/profile_icon.png",
                          width: 15,
                        ),
                        Text(
                          "Avatar",
                        ),
                        Expanded(child: Container()),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Icon(
                            Icons.account_circle_outlined,
                            size: 50,
                            color: Color.fromARGB(255, 104, 47, 157),
                          ),
                        ),
                      ],
                    ))),
            InkWell(
                onTap: () async {
                  // Navigator.push(
                  // context, MaterialPageRoute(builder: (context) => page));
                },
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/profile_icon.png",
                                  width: 15,
                                ),
                                Text(
                                  "Name",
                                ),
                              ],
                            ),
                            Text(
                              "Ak",
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Text('Edit'),
                      ],
                    ))),
            InkWell(
                onTap: () async {
                  // Navigator.push(
                  // context, MaterialPageRoute(builder: (context) => page));
                },
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/profile_icon.png",
                                  width: 15,
                                ),
                                Text(
                                  "Introduction",
                                ),
                              ],
                            ),
                            Text(
                              "Hi I am Ak",
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Text('Edit'),
                      ],
                    ))),
          ],
        ));
  }
}
