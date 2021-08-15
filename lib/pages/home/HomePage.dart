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
        // appBar: AppBar(
        //   shadowColor: Colors.white,
        //   backgroundColor: Color.fromARGB(255, 104, 47, 157),
        //   title: Row(
        //     children: [
        //       new GestureDetector(
        //         onTap: () {
        //           setState(() {
        //             tab = "follow";
        //           });
        //         },
        //         child: Text(
        //           'Follow',
        //           style: TextStyle(
        //               color: Colors.white,
        //               decoration: tab == "follow"
        //                   ? TextDecoration.underline
        //                   : TextDecoration.none),
        //         ),
        //       ),
        //       SizedBox(width: 10),
        //       new GestureDetector(
        //         onTap: () {
        //           setState(() {
        //             tab = "recommad";
        //           });
        //         },
        //         child: Text(
        //           'Recommend',
        //           style: TextStyle(
        //               color: Colors.white,
        //               decoration: tab == "recommad"
        //                   ? TextDecoration.underline
        //                   : TextDecoration.none),
        //         ),
        //       ),
        //     ],
        //   ),
        //   actions: [
        //     new IconButton(
        //       icon: new Icon(Icons.search),
        //       color: Colors.grey[200],
        //       highlightColor: Colors.grey[200],
        //       onPressed: () {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => FindPage()));
        //       },
        //     ),
        //   ],
        // ),
        body: recommand());
  }

  Widget ads(BuildContext context) {
    //调试线显示
    // debugPaintSizeEnabled = true;
    return Container(
        padding: EdgeInsets.only(top: 10, right: 40),
        decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(Radius.circular(20.0)),
            image: DecorationImage(
              image: AssetImage("assets/images/example/3.png"),
              fit: BoxFit.cover,
            )),
        height: 120,
        margin: EdgeInsets.all(10),
        alignment: Alignment.topRight,
        child: Text("广告投放"));
  }

  Widget header(BuildContext context, String img) {
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
                    img,
                    width: (size.width / 2) - 20,
                    fit: BoxFit.cover
                    //对齐方式
                    ))));
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

  Widget header3(BuildContext context, String img) {
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
            height: (size.width / 3) + 20,
            width: (size.width / 3) - 20,
            child: Column(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                      //加载的图片
                      img,
                      width: (size.width / 3) - 20,
                      fit: BoxFit.cover
                      //对齐方式
                      )),
              Container(
                margin: EdgeInsets.only(top: 5, right: 10, left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "西餐料理",
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
          margin: EdgeInsets.all(10),
          child: TextFormField(
            autofocus: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: '',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              suffixIcon: GestureDetector(
                child: Icon(
                  Icons.search,
                ),
              ),
            ),
          )),
      Container(
          height: (size.width / 2),
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SizedBox(width: 10),
              header(context, 'assets/images/example/1.png'),
              header(context, 'assets/images/example/2.png'),
              header(context, 'assets/images/example/1.png'),
              header(context, 'assets/images/example/2.png'),
              header(context, 'assets/images/example/1.png'),
              header(context, 'assets/images/example/2.png'),
              SizedBox(width: 10),
            ],
          )),
      GridView.count(
        crossAxisCount: 4,
        childAspectRatio: (3 / 2),
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
              child: Text("popular", style: TextStyle(fontSize: 15)),
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
              child: Text("Live Class", style: TextStyle(fontSize: 15)),
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
              child: Text("classify", style: TextStyle(fontSize: 15)),
            ),
          ),
        ],
      ),
      ads(context),
      Align(
          alignment: Alignment.centerLeft,
          child: Container(
              margin: EdgeInsets.only(
                left: 10,
              ),
              padding: EdgeInsets.all(8),
              decoration: new BoxDecoration(
                  color: Color.fromARGB(255, 104, 47, 157),
                  borderRadius: new BorderRadius.all(Radius.circular(40.0))),
              child: Text(
                "Popular",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ))),
      Container(
          height: (size.width / 3) + 10,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SizedBox(width: 10),
              header3(context, 'assets/images/example/4.png'),
              header3(context, 'assets/images/example/5.png'),
              header3(context, 'assets/images/example/6.png'),
              header3(context, 'assets/images/example/4.png'),
              header3(context, 'assets/images/example/5.png'),
              header3(context, 'assets/images/example/6.png'),
              SizedBox(width: 10),
            ],
          )),
    ]);
  }
}
