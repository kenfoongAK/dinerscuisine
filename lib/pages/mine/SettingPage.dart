import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<SettingPage> {
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
            'Setting',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(children: <Widget>[
          InkWell(
              onTap: () async {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => page));
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Row(
                    children: [
                      Text("Change Password",
                          style: TextStyle(color: Colors.grey)),
                      Expanded(child: Container()),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Colors.grey,
                      ),
                    ],
                  )))
        ]));
  }
}
