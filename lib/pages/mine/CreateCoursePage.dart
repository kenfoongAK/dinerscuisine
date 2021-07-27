import 'package:demo2/pages/mine/createCourse/LiveLessonWait.page.dart';
import 'package:demo2/pages/mine/createCourse/VideoLessonPage.dart';
import 'package:flutter/material.dart';

class CreateCoursePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<CreateCoursePage> {
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
            'Create Course',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                child: Text(
                  "Choose your course type",
                  style: TextStyle(
                      color: Color.fromARGB(255, 104, 47, 157), fontSize: 20),
                )),
            Row(
              children: [
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoLessonPage()));
                    },
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    color: Color.fromARGB(255, 104, 47, 157),
                    textColor: Colors.white,
                    child: Text("Video lesson", style: TextStyle(fontSize: 15)),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LiveLessonWaitPage()));
                    },
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    color: Color.fromARGB(255, 104, 47, 157),
                    textColor: Colors.white,
                    child: Text("Live Lesson Wait",
                        style: TextStyle(fontSize: 15)),
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ],
        ));
  }
}
