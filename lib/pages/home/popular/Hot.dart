import 'package:flutter/material.dart';

class HotPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<HotPage> {
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
            'Hot',
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
            width: (size.width / 2) - 20,
            alignment: Alignment.centerLeft,
            child: Text(
              "和我一起设计配方低糖低油四口味热卖贝果",
              textAlign: TextAlign.left,
            ),
          )
        ]));
  }
}
