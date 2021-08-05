import 'package:demo2/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:demo2/pages/MainPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //应用名称
      title: 'Dinerscuisine',
      theme: new ThemeData(
        //蓝色主题
        primarySwatch: Colors.blue,
      ),
      //应用首页路由
      // debugShowCheckedModeBanner: false,
      // home: MainPage(), //启动MainPage
      home: LoginPage(), //启动MainPage
    );
  }
}
