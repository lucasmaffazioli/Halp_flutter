import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:halp/models/post_comment_model.dart';

void printWrapped(String text) {
  final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

Future<List<PostCommentModel>> getPostComments(int postId) async {
  PostCommentModel comment;
  List<PostCommentModel> comments = [];

  String jsonString = await rootBundle.loadString('assets/data/post_comments.json');

  List<dynamic> data = jsonDecode(jsonString);

  print('getPostDetails');
  printWrapped(data.toString());
  printWrapped(data[0].toString());

  if (data.length > 0) {
    for (final item in data) {
      print('item');
      print(item);
      comment = new PostCommentModel(
          commentId: item['id'],
          commentTitle: item['title'],
          commentUserId: item['userId'],
          commentUserName: item['userName'],
          commentIsVerified: item['isVerified'],
          commentHearts: item['hearts'],
          commentVideoPreview: item['videoPreview'],
          commentAvatar: item['avatar']);
      comments.add(comment);
    }
  }
  print(comments);
  return comments;

  // listCommentsTemp.add(
  //   PostFullCard(
  //     itemModel,
  //     isReply: true,
  //     child: ImageFormatter(
  //       height: 400,
  //       image: widget.args.videoPreview,
  //     ),
  //   ),
  // );
  //   }
  // }
  // return listCommentsTemp;
  // return Future.delayed(const Duration(milliseconds: 500), () {
  //   setState(() {
  //     listComments.clear();
  //     listComments = listCommentsTemp;
  //   });
  // });
}
