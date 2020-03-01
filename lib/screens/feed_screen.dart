import 'package:flutter/material.dart';
import 'package:halp/widgets/video_block_widget.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              // child: Text('aaaaaaa'),
              child: VideoBlock(),
            ),
            Container(
              // child: Text('aaaaaaa'),
              child: VideoBlock(),
            ),
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
    );
  }
}
