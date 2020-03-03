import 'package:flutter/material.dart';
import 'package:halp/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Login();
    // return MaterialApp(
    //   theme: ThemeData(
    //     fontFamily: 'MPLUSRounded1c',
    //     // fontFamily: GoogleFonts.mPLUSRounded1c(),
    //   ),
    //   home: Login(),
    // );
  }
}
