import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MarketPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<MarketPage> {
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
          title: Text(
            'Market',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(children: <Widget>[
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
        ]));
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
