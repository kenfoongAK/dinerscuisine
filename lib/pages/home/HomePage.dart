import 'package:demo2/pages/home/FindPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    /*24 is for notification bar on Android*/
    return new Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(
          'Recommend',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          new IconButton(
            icon: new Icon(Icons.search),
            color: Colors.grey[200],
            highlightColor: Colors.grey[200],
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FindPage()));
            },
          ),
        ],
      ),
      body: ListView(children: <Widget>[
        Container(
            height: 400,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(width: 10),
                header(context),
                header(context),
                header(context),
                header(context),
                header(context),
                header(context),
                header(context),
                header(context),
                SizedBox(width: 10),
              ],
            )),
        GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (2 / 1),
          physics:
              NeverScrollableScrollPhysics(), // to disable GridView's scrolling
          shrinkWrap: true, // You won't see infinite size error
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              height: 50.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                onPressed: () {},
                padding: EdgeInsets.all(10.0),
                color: Colors.grey[300],
                textColor: Colors.white,
                child: Text("All Course", style: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 50.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                onPressed: () {},
                padding: EdgeInsets.all(10.0),
                color: Colors.grey[300],
                textColor: Colors.white,
                child: Text("Wait", style: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 50.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                onPressed: () {},
                padding: EdgeInsets.all(10.0),
                color: Colors.grey[300],
                textColor: Colors.white,
                child: Text("Wait", style: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 50.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                onPressed: () {},
                padding: EdgeInsets.all(10.0),
                color: Colors.grey[300],
                textColor: Colors.white,
                child: Text("Wait", style: TextStyle(fontSize: 15)),
              ),
            ),
          ],
        ),
        ads(context),
      ]),
    );
  }

  Widget header(BuildContext context) {
    //调试线显示
    // debugPaintSizeEnabled = true;
    return Container(
        margin: EdgeInsets.all(10),
        height: 400,
        width: 200,
        child: Image.asset(
          //加载的图片
          'assets/images/daily.jpg',
          fit: BoxFit.fill,
          //对齐方式
        ));
  }

  Widget ads(BuildContext context) {
    //调试线显示
    // debugPaintSizeEnabled = true;
    return Container(
        color: Colors.grey,
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        height: 100,
        child: Text("ads"));
  }
}
