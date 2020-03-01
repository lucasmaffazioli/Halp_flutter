import 'package:flutter/material.dart';
import 'package:halp/screens/login.dart';
import 'package:google_fonts/google_fonts.dart';

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
