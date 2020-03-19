import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter/material.dart';
import 'package:halp/components/action_button.dart';
import 'package:halp/components/base_scaffold.dart';
import 'package:halp/components/icon_label.dart';
import 'package:halp/components/post_card.dart';
import 'package:halp/components/post_full_card.dart';
import 'package:halp/components/tag.dart';
import 'package:halp/misc/arguments_post_screen.dart';
import 'package:halp/misc/constants.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:flutter/services.dart';

class PostScreen extends StatelessWidget {
  int id;
  String title;
  String userName;
  int hearts;
  int comments;
  Image imagePreview;
  AssetImage imageAvatar;
  List<String> tags;
  ArgumentsPostScreen arguments;

  PostScreen({
    @required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: mainWhite,
    ));
    this.id = arguments.id;
    this.title = arguments.title;
    this.userName = arguments.userName;
    this.hearts = arguments.hearts;
    this.comments = arguments.comments;
    this.imagePreview = arguments.imagePreview;
    this.imageAvatar = arguments.imageAvatar;
    this.tags = arguments.tags;
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
                          'assets/images/mockup_video_Ayaki.jpg',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      // child: imagePreview,
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
                          imageAvatar: imageAvatar,
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
                          imageAvatar: imageAvatar,
                          userName: 'ATHLEAN-X™',
                          title: 'Primeiro treine seus abs!',
                          hearts: 301,
                          child: Image.asset('assets/images/mockup_video_Ayaki.jpg'),
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
