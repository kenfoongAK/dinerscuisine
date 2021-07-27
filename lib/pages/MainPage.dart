import 'package:demo2/pages/learn/Learn.dart';
import 'package:demo2/pages/market/MarketPage.dart';
import 'package:demo2/pages/notification/Notification.dart';
import 'package:demo2/pages/other/payment.dart';
import 'package:flutter/material.dart';
import 'package:demo2/pages/home/FindPage.dart';
import 'package:demo2/pages/home/HomePage.dart';
import 'package:demo2/pages/mine/MinePage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        //去除右上标的Debug
        debugShowCheckedModeBanner: false,
        home: new MainPageWidget());
  }
}

//有状态的Widget
class MainPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //重写了createState()函数，这函数返回一个State<StatefulWidget>
    return new MainPageState(); //返回用户定义的类MainPageWidget的MainPageState()实例
  }
}

//继承了 State<MainPageWidget>
class MainPageState extends State<MainPageWidget> {
  int _tabIndex = 0;
  var tabImages;
  var appBarIcons = [
    Icons.home_outlined,
    Icons.subtitles_outlined,
    Icons.add_shopping_cart,
    Icons.notifications_none,
    Icons.perm_identity
  ];
  var appBarTitles = ['Home', 'Learn', 'Market', 'Message', 'Me'];
  //存放子页面
  var _pageList;

  /*
   * 根据选择获得对应的normal或是press的icon
   */
  Icon getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return Icon(appBarIcons[curIndex],
          color: Color.fromARGB(255, 104, 47, 157));
    }
    return Icon(appBarIcons[curIndex], color: const Color(0xff515151));
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(
              fontSize: 14.0, color: Color.fromARGB(255, 104, 47, 157)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff515151)));
    }
  }

  /*
   * 根据image路径获取图片
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }

  void initData() {
    /*
     * 初始化选中和未选中的icon
     */
    tabImages = [
      [getTabImage('images/home.png'), getTabImage('images/home_selected.png')],
      [getTabImage('images/find.png'), getTabImage('images/find_selected.png')],
      [getTabImage('images/mine.png'), getTabImage('images/mine_selected.png')],
      [
        getTabImage('images/notification_selected.png'),
        getTabImage('images/notification_selected.png')
      ],
      [getTabImage('images/me.png'), getTabImage('images/me.png')]
    ];
    /*
     * 三个子界面
     */
    _pageList = [
      new HomePage(),
      new LearnPage(),
      new MarketPage(),
      new NotificationPage(),
      new MinePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    //初始化数据
    initData();
    return Scaffold(
        //
        body: _pageList[_tabIndex],
        bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: getTabIcon(0),
                // icon: Icon(Icons.home),
                title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(1), title: getTabTitle(1)),
            new BottomNavigationBarItem(
                icon: getTabIcon(2), title: getTabTitle(2)),
            new BottomNavigationBarItem(
                icon: getTabIcon(3), title: getTabTitle(3)),
            new BottomNavigationBarItem(
                icon: getTabIcon(4), title: getTabTitle(4)),
          ],
          //bottom文字显示控制
          type: BottomNavigationBarType.fixed,
          //默认选中首页
          currentIndex: _tabIndex,
          iconSize: 24.0,
          //点击事件
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ));
  }
}
