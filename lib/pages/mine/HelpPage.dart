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
        body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: itemData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: ExpansionPanelList(
                animationDuration: Duration(milliseconds: 200),
                dividerColor: Colors.green,
                expandedHeaderPadding: EdgeInsets.only(bottom: 0.0),
                elevation: 1,
                children: [
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          itemData[index].headerItem,
                          style: TextStyle(
                            color: itemData[index].colorsItem,
                            fontSize: 13,
                          ),
                        ),
                      );
                    },
                    body: Container(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            itemData[index].discription,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    isExpanded: itemData[index].expanded,
                  )
                ],
                expansionCallback: (int item, bool status) {
                  setState(() {
                    itemData[index].expanded = !itemData[index].expanded;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }

  List itemData = <ItemData>[
    ItemModel(
      headerItem: 'how to be a teacher',
      discription:
          "Go to be a teacher/tutor page and then signin or singup.",
      colorsItem: Colors.blue,
    ),
    ItemModel(
      headerItem: 'how to make a payment',
      discription:
          "go to payment page and select pay to.",
      colorsItem: Colors.orange,
    ),
    ItemModel(
      headerItem: 'how to contact us',
      discription:
          "go to feedback page and send us a message. ",
      colorsItem: Colors.black,
    ),
    ItemModel(
      headerItem: 'how to rate a tutor',
      discription:
          "click on rank/praise .",
      colorsItem: Colors.redAccent,
    ),
  ];
}

class ItemData {
}

ItemModel({String? headerItem, String? discription, required Color colorsItem})  {}
