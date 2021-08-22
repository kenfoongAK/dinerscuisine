import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<HelpPage> {
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
            'Help',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {},
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text('Help'),
                  );
                },
                body: ListTile(
                  title: Text('how to be a teacher/tutor'),
                  subtitle: Text('go to be a teacher/tutor'),
                ),
                isExpanded: true,
              ),
            ]));
  }
}
