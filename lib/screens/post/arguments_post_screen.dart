import 'package:flutter/cupertino.dart';

class ArgumentsPostScreen {
  final int id;
  final String title;
  final String userName;
  final int hearts;
  final int comments;
  final String imagePreview;
  final AssetImage imageAvatar;
  final List<String> tags;
  ArgumentsPostScreen(
      {@required this.id,
      @required this.title,
      @required this.userName,
      @required this.hearts,
      @required this.imagePreview,
      @required this.imageAvatar,
      @required this.tags,
      @required this.comments});
}
