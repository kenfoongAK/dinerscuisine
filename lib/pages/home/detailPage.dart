import 'package:demo2/pages/other/tutorPage.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';

class DetailPage extends StatefulWidget {
  @override
  Page createState() => Page();
}

class Page extends State<DetailPage> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    // flickManager = FlickManager(
    //   videoPlayerController: VideoPlayerController.network(
    //       "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4"),
    // );
    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.asset("assets/images/tutorial.mp4"),
    );
  }

  @override
  void dispose() {
    super.dispose();
    flickManager.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    /*24 is for notification bar on Android*/
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 104, 47, 157),
        title: Text(''),
      ),
      body: ListView(children: <Widget>[
        Container(
          child: FlickVideoPlayer(flickManager: flickManager),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 20, top: 20),
          child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TutorPage()));
              },
              child: Icon(
                Icons.account_circle_outlined,
                size: 50,
                color: Color.fromARGB(255, 104, 47, 157),
              )),
        ),
        Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Text(
            "浅浅嫣然笑",
            style: TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 104, 47, 157)),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Text(
            "视频课/共11课",
            style: TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 104, 47, 157)),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 40),
          child: Text(
            "不要传统蛋黄酥新品全麦低糖七种口味蛋黄酥上市,在这里新增打赏",
            style: TextStyle(
                color: Color.fromARGB(255, 104, 47, 157),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, top: 10, right: 20),
          alignment: Alignment.centerRight,
          child: Text(
            "23人学过",
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                // Replace with a Row for horizontal icon + text
                children: <Widget>[Icon(Icons.chat_outlined), Text("Contact")],
              ),
            ),
            Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[Icon(Icons.star_border), Text("Favorite")],
                )),
            Expanded(child: Container()),
            Container(
              margin: EdgeInsets.all(20),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                onPressed: () {},
                padding: EdgeInsets.all(10.0),
                color: Color.fromRGBO(205, 0, 0, 1),
                textColor: Colors.white,
                child: Text("Free Join", style: TextStyle(fontSize: 15)),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
