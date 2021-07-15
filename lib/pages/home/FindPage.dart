import 'package:flutter/material.dart';

class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('发现'),
      ),
      body: new ListView(
        children: <Widget>[
          header(context),
          //header(context),
          //header(context),
          //header(context),
          //header(context),
        ],
      ),
    );
  }

  Widget header(BuildContext context) {
    //return new Image.network(
    //'https://i2.chuimg.com/9104e46a512a4bb3a50f921fea9e67e1_3900w_2600h.jpg',
    return new Image.asset(
      'assets/images/daily.jpg',
    );
  }
}
