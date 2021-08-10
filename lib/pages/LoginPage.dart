import 'dart:convert';

import 'package:demo2/pages/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<LoginPage> {
  var titles = ['Login', 'Sign Up'];
  int tab = 0;
  TextEditingController username = new TextEditingController(text: "");
  TextEditingController password = new TextEditingController(text: "");
  String error = "";

  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  @override
  void initState() {
    super.initState();
    // getPage();
  }

  bool check() {
    if (username.text == "" || password.text == "") {
      setState(() {
        error = "Username and Password can not be empty";
      });
      return false;
    }
    return true;
  }

  // Future<bool> getPage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (prefs.getInt("id") != null) {
  //     // ignore: unused_element
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (context) => MainPage()),
  //         (Route<dynamic> route) => false);
  //   }
  //   return false;
  // }

  Future<void> login() async {
    if (check()) {
      EasyLoading.show(status: 'loading...');

      try {
        var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
        var request = http.Request(
            'POST', Uri.parse('https://app.shanghai168.com/api/login/'));
        request.bodyFields = {
          'username': username.text,
          'password': password.text
        };
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          final result =
              await json.decode(await response.stream.bytesToString());
          // Create storage
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setInt('id', result['data']);
          EasyLoading.dismiss();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MainPage()),
              (Route<dynamic> route) => false);
        } else {
          setState(() {
            error = "Username And Password Not Match";
          });
          EasyLoading.dismiss();
        }
      } catch (error) {
        EasyLoading.dismiss();
        debugPrint('Error: $error');
      }
    }
    // print(result);
  }

  Future<void> reg() async {
    if (check()) {
      EasyLoading.show(status: 'loading...');

      try {
        var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
        var request = http.Request(
            'POST', Uri.parse('https://app.shanghai168.com/api/reg/'));
        request.bodyFields = {
          'username': username.text,
          'password': password.text
        };
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          final result =
              await json.decode(await response.stream.bytesToString());
          // Create storage
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setInt('id', result['data'][0]);
          EasyLoading.dismiss();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MainPage()),
              (Route<dynamic> route) => false);
        } else {
          setState(() {
            error = "Username Already Exist";
          });
          EasyLoading.dismiss();
        }
      } catch (error) {
        EasyLoading.dismiss();
        debugPrint('Error: $error');
      }
    }
    // print(result);
  }

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
            controller: username,
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
            controller: password,
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
              tab == 0 ? login() : reg();
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
        Text(
          "\n" + error,
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15),
        )
      ]),
    ));
  }
}
