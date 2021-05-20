import 'package:flutter/material.dart';
import 'package:ui_design/detailShoes.dart';
import 'package:ui_design/discover.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return ScreenUtilInit(
      designSize: Size(720, 1280),
        builder:()=>  MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            "/":(context)=>MyHomePage(),
            "/detail":(context)=>DetailPage(),
          },
          debugShowCheckedModeBanner: false,
        ),
    );

  }
}

