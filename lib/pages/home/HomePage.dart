import 'package:demo2/pages/home/FindPage.dart';
import 'package:demo2/pages/home/detailPage.dart';
import 'package:demo2/pages/home/popular/AllCoursesPage.dart';
import 'package:demo2/pages/home/popular/Hot.dart';
import 'package:demo2/pages/home/popular/Live.dart';
import 'package:demo2/pages/home/popular/Sort.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<HomePage> {
  String tab = "recommad";
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    /*24 is for notification bar on Android*/
    return new Scaffold(
        appBar: AppBar(
          shadowColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 104, 47, 157),
          title: Row(
            children: [
              new GestureDetector(
                onTap: () {
                  setState(() {
                    tab = "follow";
                  });
                },
                child: Text(
                  'Follow',
                  style: TextStyle(
                      color: Colors.white,
                      decoration: tab == "follow"
                          ? TextDecoration.underline
                          : TextDecoration.none),
                ),
              ),
              SizedBox(width: 10),
              new GestureDetector(
                onTap: () {
                  setState(() {
                    tab = "recommad";
                  });
                },
                child: Text(
                  'Recommend',
                  style: TextStyle(
                      color: Colors.white,
                      decoration: tab == "recommad"
                          ? TextDecoration.underline
                          : TextDecoration.none),
                ),
              ),
            ],
          ),
          actions: [
            new IconButton(
              icon: new Icon(Icons.search),
              color: Colors.grey[200],
              highlightColor: Colors.grey[200],
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FindPage()));
              },
            ),
          ],
        ),
        body: tab == "recommad" ? recommand() : follow());
  }

  Widget header(BuildContext context) {
    var size = MediaQuery.of(context).size;

    //调试线显示
    // debugPaintSizeEnabled = true;
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailPage()));
        },
        child: Container(
            margin: EdgeInsets.all(10),
            height: (size.width / 2),
            width: (size.width / 2),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                    //加载的图片
                    'assets/images/daily.jpg',
                    width: (size.width / 2) - 20,
                    fit: BoxFit.cover
                    //对齐方式
                    ))));
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

  Widget header2(BuildContext context, String img) {
    var size = MediaQuery.of(context).size;

    //调试线显示
    // debugPaintSizeEnabled = true;
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailPage()));
        },
        child: Container(
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
                  "教学",
                  textAlign: TextAlign.left,
                ),
              )
            ])));
  }

  ListView follow() {
    return ListView(children: <Widget>[
      Row(
        children: [
          header2(context, 'assets/images/1.jpg'),
          header2(context, 'assets/images/2.jpg'),
        ],
      ),
      Row(
        children: [
          header2(context, 'assets/images/3.jpg'),
          header2(context, 'assets/images/4.jpg'),
        ],
      ),
      Row(
        children: [
          header2(context, 'assets/images/1.jpg'),
          header2(context, 'assets/images/3.jpg'),
        ],
      ),
      Row(
        children: [
          header2(context, 'assets/images/2.jpg'),
        ],
      ),
    ]);
  }

  ListView recommand() {
    var size = MediaQuery.of(context).size;

    return ListView(children: <Widget>[
      Container(
          height: (size.width / 2),
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
      Container(
          margin: EdgeInsets.only(
            left: 10,
          ),
          child: Text(
            "Popular",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
      GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (3 / 1),
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
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllCoursePage()));
              },
              padding: EdgeInsets.all(10.0),
              color: Color.fromARGB(255, 104, 47, 157),
              textColor: Colors.white,
              child: Text("All Courses", style: TextStyle(fontSize: 15)),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LivePage()));
              },
              padding: EdgeInsets.all(10.0),
              color: Color.fromARGB(255, 104, 47, 157),
              textColor: Colors.white,
              child: Text("Live", style: TextStyle(fontSize: 15)),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HotPage()));
              },
              padding: EdgeInsets.all(10.0),
              color: Color.fromARGB(255, 104, 47, 157),
              textColor: Colors.white,
              child: Text("Hot", style: TextStyle(fontSize: 15)),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SortPage()));
              },
              padding: EdgeInsets.all(10.0),
              color: Color.fromARGB(255, 104, 47, 157),
              textColor: Colors.white,
              child: Text("Sort", style: TextStyle(fontSize: 15)),
            ),
          ),
        ],
      ),
      ads(context),
    ]);
  }
}
