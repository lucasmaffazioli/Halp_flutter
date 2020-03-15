import 'package:flutter/material.dart';
import 'package:halp/components/base_layout.dart';

class PostScreen extends StatelessWidget {
  final int postId;
  PostScreen({@required this.postId});
  // final ScreenArgument arguments;

  @override
  Widget build(BuildContext context) {
    return Text(
      postId.toString(),
    );
  }
}
