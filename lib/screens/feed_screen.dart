import 'package:flutter/material.dart';
import 'package:halp/components/post_feed.dart';
// import 'package:halp/components/video_block_widget.dart';
import 'package:halp/misc/constants.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: ListView(
            children: <Widget>[
              PostFeed(),
              Container(
                child: Text('aaaaaaa'),
                // child: VideoBlock(),
              ),
              Container(
                child: Text('aaaaaaa'),
                // child: VideoBlock(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
