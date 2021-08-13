import 'dart:io';

import 'package:demo2/pages/FirstPage.dart';
import 'package:demo2/pages/LoginPage.dart';
import 'package:demo2/pages/home/HomePage.dart';
import 'package:demo2/pages/mine/MinePage.dart';
import 'package:demo2/pages/mine/SuccessPage.dart';
import 'package:demo2/pages/mine/createCourse/VideoLessonPage.dart';
import 'package:demo2/pages/other/tutorPage.dart';
import 'package:flutter/material.dart';
import 'package:demo2/pages/MainPage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  Widget tab = LoginPage();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        //应用名称
        title: 'Dinerscuisine',
        theme: new ThemeData(
          //蓝色主题
          primarySwatch: Colors.blue,
        ),
        builder: EasyLoading.init(),
        //应用首页路由
        // debugShowCheckedModeBanner: false,
        // home: MainPage()) //启动MainPage
        // ignore: unrelated_type_equality_checks
        home: FirstPage()); //启动MainPage
    // home: TutorPage())
  }
}
