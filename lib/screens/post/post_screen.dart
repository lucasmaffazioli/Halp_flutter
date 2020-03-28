import 'package:flutter/material.dart';
import 'package:halp/components/base_scaffold.dart';
import 'package:halp/components/image_formatter.dart';
import 'package:halp/components/tag.dart';
import 'package:halp/misc/constants.dart';
import 'package:flutter/services.dart';
import 'package:halp/screens/post/arguments_post_screen.dart';
import 'package:halp/screens/post/components/post_card.dart';
import 'package:halp/screens/post/components/post_full_card.dart';

class PostScreen extends StatelessWidget {
  static const routeName = '/post';
  final int id;
  final String title;
  final String userName;
  final int hearts;
  final int comments;
  final String videoPreview;
  final String avatar;
  final List<String> tags;
  final ArgumentsPostScreen arguments;

  PostScreen({@required this.arguments})
      : id = arguments.id,
        title = arguments.title,
        userName = arguments.userName,
        hearts = arguments.hearts,
        comments = arguments.comments,
        videoPreview = arguments.videoPreview,
        avatar = arguments.avatar,
        tags = arguments.tags;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: mainWhite,
    ));
    return BaseScaffold(
      body: Container(
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
                        child: Image.asset(
                          videoPreview,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      // child: videoPreview,
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
                          isReply: false,
                          avatar: avatar,
                          userName: userName,
                          title: title,
                          hearts: hearts,
                          comments: comments,
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
                                  for (var tag in tags)
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
                        PostFullCard(
                          isReply: true,
                          avatar: avatar,
                          userName: 'ATHLEAN-X™',
                          title: 'Primeiro treine seus abs!',
                          hearts: 301,
                          child: ImageFormatter(
                            height: 400,
                            image: videoPreview,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
