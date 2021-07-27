import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<NotificationPage> {
  var icon = [
    "assets/images/n1.png",
    "assets/images/n2.png",
    "assets/images/n3.png",
    "assets/images/n4.png",
    "assets/images/n5.png"
  ];

  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    /*24 is for notification bar on Android*/
    return new Scaffold(
        appBar: AppBar(
          shadowColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 104, 47, 157),
          title: Text(
            'Notification',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(children: <Widget>[
          notificationContent(0, "今日好课", "中秋节断货。。。。。。", "07月14日 12:26"),
          notificationContent(1, "今日好课", "中秋节断货。。。。。。", "07月14日 12:26"),
          notificationContent(2, "今日好课", "中秋节断货。。。。。。", "07月14日 12:26"),
          notificationContent(3, "今日好课", "中秋节断货。。。。。。", "07月14日 12:26"),
          notificationContent(4, "今日好课", "中秋节断货。。。。。。", "07月14日 12:26"),
        ]));
  }

  Widget notificationContent(type, title, content, date) {
    //调试线显示
    // debugPaintSizeEnabled = true;
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Image.asset(
            icon[type],
            width: 50,
            height: 50,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  content,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  date,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
