// ignore: file_names
// ignore: file_names
import 'dart:convert';

import 'package:demo2/pages/mine/SuccessPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class BeATeacherPage extends StatefulWidget {
  @override
  _BeATeacherState createState() => _BeATeacherState();
}

class _BeATeacherState extends State<BeATeacherPage> {
  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLMail() async {
    const url =
        'mailto:mashneh9@gmail.com?subject=LifePlusApp&body=Your sugestions%20or BeATutor..';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  late String name;
  late String email;
  late String message;
  late String descirption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 104, 47, 157),
        title: Text("Be A Teacher"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 13),
              child: Text(
                "Become a teacher/tutor, earn and get paid for teaching. ",
                style: TextStyle(
                  fontSize: 17.6,
                  height: 1.4,
                  fontFamily: 'RobotoSlab',
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                onChanged: (val) {
                  if (val != null || val.length > 0) {
                    name = val;
                  }
                },
                textAlign: TextAlign.start,
                controller: t1,
                decoration: InputDecoration(
                  fillColor: Color(0xffe6e6e6),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 22),
                  hintText: 'Email',
                  hintStyle:
                      TextStyle(color: Colors.grey, fontFamily: 'RobotoSlab'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(13),
                    ),
                    borderSide: BorderSide(color: Colors.orangeAccent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(13),
                    ),
                    borderSide: BorderSide(color: Colors.orangeAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(color: Colors.orangeAccent),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0002,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                onChanged: (val) {
                  if (val != null || val.length > 0) {
                    message = val;
                  }
                },
                textAlign: TextAlign.start,
                controller: t2,
                decoration: InputDecoration(
                  fillColor: Color(0xffe6e6e6),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  hintText: 'Username',
                  hintStyle:
                      TextStyle(color: Colors.grey, fontFamily: 'RobotoSlab'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(13),
                    ),
                    borderSide: BorderSide(color: Colors.orangeAccent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(13),
                    ),
                    borderSide: BorderSide(color: Colors.orangeAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(color: Colors.orangeAccent),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0002,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                onChanged: (val) {
                  if (val != null || val.length > 0) {
                    message = val;
                  }
                },
                textAlign: TextAlign.start,
                controller: t3,
                decoration: InputDecoration(
                  fillColor: Color(0xffe6e6e6),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                  hintText: 'Context',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'RobotoSlab',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                    borderSide: BorderSide(color: Colors.orangeAccent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(17),
                    ),
                    borderSide: BorderSide(color: Colors.orangeAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                    borderSide: BorderSide(color: Colors.orangeAccent),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Card(
              color: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0),
              ),
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      t1.clear();
                      t2.clear();
                      launchUrl(
                          "mailto:mashneh@gmail.com?subject=From $name&body=$message");
                    });
                  },
                  child: InkWell(
                    onTap: () {
                      submit();
                    },
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                              child: Icon(
                            Icons.send,
                            color: Colors.white,
                          )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Center(
                              child: Text(
                            "Submit",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'RobotoSlab'),
                          )),
                        ],
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> submit() async {
    EasyLoading.show(status: 'loading...');

    var headers = {
      'Authorization': 'Basic bTRoU0gya0lqVFhOV0hmNUVXOng=',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST', Uri.parse('https://vanguardii.freshdesk.com/api/v2/tickets'));
    request.body = json.encode({
      "email": t1.text,
      "subject": "Be A Teacher(" + t2.text + ")",
      "description": t3.text,
      "status": 2,
      "priority": 1
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201 || response.statusCode == 200) {
      EasyLoading.dismiss();
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SuccessPage()));
      // print(await response.stream.bytesToString());
    } else {
      EasyLoading.dismiss();
    }
  }
}
