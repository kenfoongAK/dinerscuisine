import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LearnPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    /*24 is for notification bar on Android*/
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 104, 47, 157),
          shadowColor: Color.fromARGB(0, 0, 0, 0),
          centerTitle: true,
          title: Column(children: [
            Text(
              "My Collection",
            ),
          ]),
        ),
        body: ListView(
          children: <Widget>[
            title("Today's income"),
            Row(
              children: [
                header(context, 'assets/images/1.jpg'),
                header(context, 'assets/images/2.jpg'),
              ],
            ),
            Row(
              children: [
                header(context, 'assets/images/3.jpg'),
                header(context, 'assets/images/4.jpg'),
              ],
            ),
            Row(
              children: [
                header(context, 'assets/images/1.jpg'),
                header(context, 'assets/images/3.jpg'),
              ],
            ),
            Row(
              children: [
                header(context, 'assets/images/2.jpg'),
              ],
            ),
          ],
        ));
  }

  Widget title(title) {
    return Container(
        color: Color.fromARGB(255, 104, 47, 157),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          alignment: Alignment.center,
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  side: BorderSide(color: Colors.white)),
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

  Widget header(BuildContext context, String img) {
    var size = MediaQuery.of(context).size;

    //调试线显示
    // debugPaintSizeEnabled = true;
    return Container(
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Image.asset(
            //加载的图片
            img,
            width: (size.width / 2) - 20,
            height: (size.width / 2) - 20,
            fit: BoxFit.fill,
            //对齐方式
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "食物上市",
              textAlign: TextAlign.left,
            ),
          )
        ]));
  }
}
