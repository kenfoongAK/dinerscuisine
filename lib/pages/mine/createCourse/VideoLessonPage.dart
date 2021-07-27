import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoLessonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<VideoLessonPage> {
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
            'Desesrt party',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            title("Upload a cover"),
            title("Upload a promo"),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: new TextField(
                decoration: new InputDecoration(
                  labelText: "Name your course",
                ),
                cursorColor: Color.fromARGB(255, 104, 47, 157),
                style: TextStyle(
                  color: Color.fromARGB(255, 104, 47, 157),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: new TextField(
                maxLength: 5,
                decoration: new InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Introduce your food",
                ),
                cursorColor: Color.fromARGB(255, 104, 47, 157),
                style: TextStyle(
                  color: Color.fromARGB(255, 104, 47, 157),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
            ),
            row('Course classification'),
            row('Suitable for the crowd'),
            row('Degree of difficulty'),
            row('duration'),
            row('Shooting equipment'),
            row('Teaching scene'),
            row('Need for use'),
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
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    color: Color.fromARGB(255, 104, 47, 157),
                    textColor: Colors.white,
                    child: Text("Help", style: TextStyle(fontSize: 15)),
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
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    color: Color.fromARGB(255, 104, 47, 157),
                    textColor: Colors.white,
                    child: Text("Release", style: TextStyle(fontSize: 15)),
                  ),
                ),
                Expanded(child: Container()),
              ],
            )
          ],
        ));
  }

  Widget title(title) {
    return Container(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      alignment: Alignment.center,
      child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(18))),
          onPressed: () {},
          padding: EdgeInsets.all(15.0),
          color: Color.fromARGB(255, 104, 47, 157),
          textColor: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: TextStyle(
                    fontSize: 15,
                  )),
            ],
          )),
    ));
  }

  Widget image(BuildContext context, String img) {
    var size = MediaQuery.of(context).size;

    //调试线显示
    // debugPaintSizeEnabled = true;
    return Container(
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Image.asset(
            //加载的图片
            img,
            width: (size.width) - 100,
            height: (size.width) - 100,
            fit: BoxFit.fill,
            //对齐方式
          ),
        ]));
  }

  Widget row(title) {
    return InkWell(
        onTap: () {},
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
                Text("fill in"),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                ),
              ],
            )));
  }
}
