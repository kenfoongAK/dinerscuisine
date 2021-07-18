import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class PaymentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<PaymentPage> {
  String _jsResult = '';
  int _idJsEngine = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
    //widget.javascriptRuntime.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(
          'Payment',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(),
    );
  }
}
