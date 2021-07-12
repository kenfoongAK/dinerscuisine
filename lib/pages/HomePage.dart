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
    return new Scaffold(
    appBar: AppBar(
      title:Text('首页'),
    ),
      body: new GridView.count(
        crossAxisCount: 2,
        //childAspectRatio: 2,
        children: <Widget>[
          header(context),
          header(context),
          header(context),
          header(context),
          header(context),
        ],
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(title: const Text('首页'));
  }


  Widget header(BuildContext context) {
    //调试线显示
    debugPaintSizeEnabled = true;
    return Image.asset(
      //加载的图片
      'assets/images/daily.jpg',
      height:150.0,
      //对齐方式
      alignment: Alignment.centerLeft,
    );
  }

}