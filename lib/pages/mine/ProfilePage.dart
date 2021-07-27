import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<ProfilePage> {
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
        body: ListView(
          children: <Widget>[
            title("Today's income"),
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                "0.00 π",
                style: TextStyle(
                  color: Colors.red[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              alignment: Alignment.center,
            ),
            Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Text('Cumulative income  '),
                    Text(
                      '96.24',
                      style: TextStyle(
                          color: Colors.red[600], fontWeight: FontWeight.bold),
                    ),
                    Text('   Participate  '),
                    Text(
                      '22',
                      style: TextStyle(
                          color: Colors.red[600], fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                )),
            Container(
                child: Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                Text(
                  'Class Schedule',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                Text('    '),
                Text('Answer'),
                Expanded(
                  child: Container(),
                ),
              ],
            )),
            title("Dessert making"),
            Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Text('Section '),
                    Text(
                      '1',
                      style: TextStyle(
                          color: Colors.red[600], fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      '30',
                      style: TextStyle(
                          color: Colors.red[600], fontWeight: FontWeight.bold),
                    ),
                    Text(' minutes '),
                    Text(
                      '50',
                      style: TextStyle(
                          color: Colors.red[600], fontWeight: FontWeight.bold),
                    ),
                    Text(' seconds '),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                )),
            Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(child: image(context, 'assets/images/1.jpg')),
                  ],
                )),
            title("Birthday cakee"),
            Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Text('Chapter '),
                    Text(
                      '2',
                      style: TextStyle(
                          color: Colors.red[600], fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      '20',
                      style: TextStyle(
                          color: Colors.red[600], fontWeight: FontWeight.bold),
                    ),
                    Text(' minutes '),
                    Text(
                      '18',
                      style: TextStyle(
                          color: Colors.red[600], fontWeight: FontWeight.bold),
                    ),
                    Text(' seconds '),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                )),
            Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(child: image(context, 'assets/images/1.jpg')),
                  ],
                )),
            Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Text('Coureware '),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      'Off shelf',
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text('Edit course'),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.all(5),
            ),
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
}
