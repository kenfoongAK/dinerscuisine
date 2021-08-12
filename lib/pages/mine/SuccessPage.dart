import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.purple[50],
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.orange,
              size: 80,
            ),
            Text(
              "\nSubmit Successfully\n",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 20,
              ),
            ),
            new GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Back",
                style: TextStyle(
                    color: Colors.orange, decoration: TextDecoration.underline),
              ),
            )
          ],
        )));
  }
}
