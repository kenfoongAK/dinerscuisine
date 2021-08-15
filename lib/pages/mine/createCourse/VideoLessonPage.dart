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
            'Dessert party',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Row(
              children: [
                Expanded(child: Container()),
                title("Add picture", "assets/images/add_picture.png"),
                Expanded(child: Container()),
                title("Add promo", "assets/images/add_promo.png"),
                Expanded(child: Container()),
              ],
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

  Widget title(title, image) {
    var size = MediaQuery.of(context).size;
    double witdh = (size.width / 2) - 20;
    double height = witdh * (600 / 500);

    return Container(
        height: height,
        width: witdh,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: new BorderRadius.all(Radius.circular(20.0)),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            )),
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              style: TextStyle(fontSize: 15),
            )));
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
            // color: Colors.white,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30), //border corner radius
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), //color of shadow
                  spreadRadius: 1, //spread radius
                  blurRadius: 1, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
                ),
                //you can set more BoxShadow() here
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                Text(title),
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
