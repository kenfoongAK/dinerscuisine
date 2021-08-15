import 'package:flutter/material.dart';

class TutorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<TutorPage> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    /*24 is for notification bar on Android*/
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/tutor_bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                  decoration: new BoxDecoration(
                      color: Color.fromARGB(150, 104, 47, 157),
                      borderRadius: new BorderRadius.all(
                        const Radius.circular(40.0),
                      )),
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(left: 20, top: 20),
                              child: Icon(
                                Icons.account_circle_outlined,
                                size: 50,
                                // color: Color.fromARGB(255, 104, 47, 157),
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text("Cherry balls",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Expanded(child: Container()),
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin:
                                EdgeInsets.only(left: 30, top: 20, right: 10),
                            child: Icon(
                              Icons.favorite,
                              size: 30,
                              color: Colors.red[800],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Column(
                                children: [
                                  Text(
                                    '7',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Praise',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )),
                          Expanded(child: Container()),
                          Column(
                            children: [
                              Text(
                                '87.5%',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Favorable rate',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                        ],
                      )
                    ],
                  ))),
          Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Text(
                    "like",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.left,
                  )),
                ],
              )),
          Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                autofocus: false,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'KEYWORD SEARCH>',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              )),
          Row(
            children: [
              header(context, 'assets/images/example/7.png'),
              header(context, 'assets/images/example/8.png'),
            ],
          ),
          Row(
            children: [
              header(context, 'assets/images/1.jpg'),
              header(context, 'assets/images/2.jpg'),
            ],
          ),
        ],
      ),
    );
  }

  Widget header(BuildContext context, String img) {
    var size = MediaQuery.of(context).size;

    //调试线显示
    // debugPaintSizeEnabled = true;
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
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
