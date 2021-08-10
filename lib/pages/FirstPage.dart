import 'package:demo2/pages/LoginPage.dart';
import 'package:demo2/pages/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    getPage();
  }

  Future<bool> getPage() async {
    Future.delayed(Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getInt("id") != null) {
        // ignore: unused_element
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MainPage()),
            (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (Route<dynamic> route) => false);
      }
    });

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    /*24 is for notification bar on Android*/
    return new Scaffold(
        backgroundColor: Colors.purple[50],
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              //加载的图片
              'assets/images/logo.png',
              width: 150,
              fit: BoxFit.fill,
              //对齐方式
            ),
            Text(
              "\nDiner",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 20,
              ),
            )
          ],
        )));
  }
}
