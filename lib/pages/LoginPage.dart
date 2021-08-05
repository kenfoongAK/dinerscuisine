import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Future<void> login() async {
    try {
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      var request = http.Request(
          'POST', Uri.parse('http://shanghai168.com:8801/api/login/'));
      request.bodyFields = {'username': 'aknormal', 'password': '1234'};
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      debugPrint('Error: $error');
    }
    // print(result);
  }

  var titles = ['Login', 'Sign Up'];
  int tab = 0;

  Widget layout(BuildContext context) {
    /*24 is for notification bar on Android*/
    return new Scaffold(
        body: Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Image.asset(
          //加载的图片
          'assets/images/logo.png',
          width: 150,
          fit: BoxFit.fill,
          //对齐方式
        ),
        Text(
          '\n' + titles[tab],
          style: TextStyle(
              color: Color.fromARGB(255, 104, 47, 157),
              fontSize: 21,
              fontWeight: FontWeight.bold),
        ),
        Container(
          width: 400,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: new TextField(
            controller: new TextEditingController(text: 'AK'),
            decoration: new InputDecoration(
                labelText: "Username",
                labelStyle: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 104, 47, 157),
                    fontWeight: FontWeight.bold),
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 104, 47, 157),
                )),
            cursorColor: Color.fromARGB(255, 104, 47, 157),
            style: TextStyle(
              color: Color.fromARGB(255, 104, 47, 157),
            ),
            keyboardType: TextInputType.text,
            // Only numbers can be entered
          ),
        ),
        Container(
          width: 400,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: new TextField(
            obscureText: true,
            controller: new TextEditingController(text: 'AK123456789'),
            decoration: new InputDecoration(
              labelText: "Password",
              labelStyle: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 104, 47, 157),
                  fontWeight: FontWeight.bold),
            ),
            cursorColor: Color.fromARGB(255, 104, 47, 157),
            style: TextStyle(
              color: Color.fromARGB(255, 104, 47, 157),
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          height: 50.0,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            onPressed: () {
              login();
            },
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            color: Color.fromARGB(255, 104, 47, 157),
            textColor: Colors.white,
            child: Text(titles[tab], style: TextStyle(fontSize: 15)),
          ),
        ),
        new GestureDetector(
          onTap: () {
            setState(() {
              tab = tab == 1 ? 0 : 1;
            });
          },
          child: Text(
            tab == 1 ? titles[0] : titles[1],
            style: TextStyle(
                color: Color.fromARGB(255, 104, 47, 157),
                decoration: TextDecoration.underline),
          ),
        ),
      ]),
    ));
  }
}
