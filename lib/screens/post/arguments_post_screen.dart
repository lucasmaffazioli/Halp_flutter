import 'package:flutter/cupertino.dart';

class ArgumentsPostScreen {
  final int id;
  final String title;
  final String userName;
  final bool isVerified;
  final int hearts;
  final int comments;
  final String videoPreview;
  final String avatar;
  final List<String> tags;
  ArgumentsPostScreen(
      {@required this.id,
      @required this.title,
      @required this.userName,
      @required this.isVerified,
      @required this.hearts,
      @required this.videoPreview,
      @required this.avatar,
      @required this.tags,
      @required this.comments});
}
