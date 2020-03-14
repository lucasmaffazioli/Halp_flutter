import 'package:flutter/material.dart';
import 'package:halp/components/post_feed.dart';
// import 'package:halp/components/video_block_widget.dart';
import 'package:halp/misc/constants.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: mainPurple,
          accentColor: secundaryPurple,
          cursorColor: secundaryPurple,
          fontFamily: mainFont,
          // backgroundColor: mainWhite,
          appBarTheme: AppBarTheme(elevation: 3),
          scaffoldBackgroundColor: mainWhite),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: mainWhite,
          brightness: Brightness.light,
          // elevation: ,
          title: Text(
            'HALP.',
            style: TextStyle(
              color: Colors.black,
              fontFamily: mainFont,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        //
        //
        //   BODY
        //
        //
        body: ListView(
          children: <Widget>[
            PostFeed(),
            PostFeed(),
           
          ],
        ),
      ),
    );
  }
}
