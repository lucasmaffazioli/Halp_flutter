import 'package:flutter/material.dart';
import 'package:halp/screens/feed_screen.dart';
import 'package:halp/screens/login.dart';
import 'package:halp/misc/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: mainPurple,
        accentColor: secundaryPurple,
        cursorColor: secundaryPurple,
        fontFamily: mainFont,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/feed': (context) => FeedScreen(),
      },
      // home: Login(),
    );
  }
}
