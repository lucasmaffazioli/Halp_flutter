import 'package:flutter/material.dart';

class PostFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset('assets/images/mockup_video_Ayaki.jpg'),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Icon(Icons.more_vert),
              Text('bbbb'),
            ],
          ),
        ],
      ),
    );
  }
}
