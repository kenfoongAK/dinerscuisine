import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
        'mailto: mashneh9@gmail.com?subject=LifePlusApp&body=Your sugestions%20or BeATutor..';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  late String name;
  late String email;
  late String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
                "Become a teacher/tutor and earn and get paid for teaching. ",
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
                  if (val != null || val.length > 0) name = val;
                },
                controller: t1,
                decoration: InputDecoration(
                  fillColor: Color(0xffe6e6e6),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 22),
                  hintText: 'Your name',
                  hintStyle: TextStyle(
                      color: Colors.blueGrey, fontFamily: 'RobotoSlab'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(13),
                    ),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(13),
                    ),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(color: Colors.green),
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
                  if (val != null || val.length > 0) message = val;
                },
                textAlign: TextAlign.start,
                controller: t2,
                decoration: InputDecoration(
                  fillColor: Color(0xffe6e6e6),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                      hintText: 'Your email',
                  hintStyle: TextStyle(
                      color: Colors.blueGrey, fontFamily: 'RobotoSlab'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(13),
                    ),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(13),
                    ),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(color: Colors.green),
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
                  if (val != null || val.length > 0) message = val;
                },
                textAlign: TextAlign.start,
                controller: t2,
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
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(17),
                    ),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Card(
              color: Colors.green[300],
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
                        "mailto:mashneh9@gmail.com?subject=From $name&body=$message");
                  });
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
                        width: MediaQuery.of(context).size.width * 0.01,
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
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: 11,
                  right: 11,
                  bottom: MediaQuery.of(context).size.height * 0.034),
              child: Text(
               
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}