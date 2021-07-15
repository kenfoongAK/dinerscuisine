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
          backgroundColor: Colors.white,
          title: Text(
            'Market',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: Text("Comming Soon"),
        ));
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
