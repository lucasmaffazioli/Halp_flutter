import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:halp/components/base_scaffold.dart';
import 'package:halp/components/image_formatter.dart';
import 'package:halp/components/tag.dart';
import 'package:halp/misc/constants.dart';
import 'package:flutter/services.dart';
import 'package:halp/models/post_comment_model.dart';
import 'package:halp/models/posts_header_model.dart';
import 'package:halp/screens/post/components/post_card.dart';
import 'package:halp/screens/post/components/post_full_card.dart';
import 'package:halp/services/getPostComments.dart';

class PostScreen extends StatefulWidget {
  static const routeName = '/post';
  final PostHeaderModel args;
  PostScreen(this.args);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Widget> listComments = [Text('Loading...')];

  void asyncFunc() async {
    List<PostCommentModel> comments = await getPostComments(widget.args.id);

    print('PostScreen');
    print(comments);

    if (comments.length > 0) {
      listComments.clear();
      for (final PostCommentModel item in comments) {
        print('item');
        print(item.commentUserName);
        print(item.toString());
        // print(item['comments']['title']);

        listComments.add(
          PostFullCard(
            // item.commentTitle,
            new PostHeaderModel(
              id: item.commentId,
              hearts: item.commentHearts,
              title: item.commentTitle,
              userId: item.commentUserId,
              userName: item.commentUserName,
              videoPreview: item.commentVideoPreview,
              avatar: item.commentAvatar,
              isVerified: item.commentIsVerified,
            ),
            isReply: true,
            child: ImageFormatter(
              height: 400,
              image: item.commentVideoPreview,
            ),
          ),
        );
        // setState(() {});

      }
    }
    return Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        // listComments.clear();
        // listComments = listCommentsTemp;
      });
    });
    //     listCommentsTemp.add(
    // PostFullCard(
    //   itemModel,
    //   isReply: true,
    //   child: ImageFormatter(
    //     height: 400,
    //     image: widget.args.videoPreview,
    //   ),
    // ),
    //     );
    //   }
    // }
  }

  @override
  void initState() {
    super.initState();
    asyncFunc();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: mainWhite,
    ));
    return Container(
      color: backgroundGrey,
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/post', arguments: id);
                },
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: 500,
                      child: // IntrinsicWidth(child: Image.network(image)
                          CachedNetworkImage(
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        imageUrl: widget.args.videoPreview,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
              //
              //   SECOND COLUMN
              //
              Container(
                transform: Matrix4.translationValues(0.0, -46, 0.0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      PostFullCard(
                        widget.args,
                        isReply: false,
                      ),
                      PostCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              'Tags',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: mainBlack,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Wrap(
                              // alignment: WrapAlignment.spaceEvenly,
                              spacing: 14, // gap between adjacent chips
                              runSpacing: 4, // gap between lines
                              children: <Tag>[
                                for (var tag in widget.args.tags)
                                  Tag(
                                    tag,
                                    isBig: true,
                                    onPressed: () {},
                                  )
                              ],
                            ),
                          ],
                        ),
                        // ActionButton(
                        //   Icons.reply,
                        //   onPressed: () {},
                        // ),
                      ),
                      // PostFullCard(
                      //   widget.args,
                      //   isReply: true,
                      //   child: ImageFormatter(
                      //     height: 400,
                      //     image: widget.args.videoPreview,
                      //   ),
                      // ),
                      Container(
                        child: Column(
                          children: listComments,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
