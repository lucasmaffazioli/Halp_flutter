import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter/material.dart';
import 'package:halp/components/action_button.dart';
import 'package:halp/components/icon_with_label.dart';
import 'package:halp/components/image_formatter.dart';
import 'package:halp/components/tag.dart';
import 'package:halp/components/user_header_block.dart';
import 'package:halp/misc/constants.dart';
import 'package:halp/models/posts_header_model.dart';
import 'package:halp/screens/post/post_screen.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:flutter/services.dart';

class FeedPost extends StatelessWidget {
  final PostHeaderModel args;
  FeedPost(this.args);

  // final int id;
  // final String title;
  // final String userName;
  // final bool isVerified;
  // final int hearts;
  // final int comments;
  // final String videoPreview;
  // final String avatar;
  // final List<String> tags;
  // FeedPost(
  //     {@required this.id,
  //     @required this.title,
  //     @required this.userName,
  //     @required this.isVerified,
  //     @required this.hearts,
  //     @required this.videoPreview,
  //     @required this.avatar,
  //     @required this.tags,
  //     @required this.comments});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: mainWhite,
    ));

    print('videoPreview');
    print(args.videoPreview);

    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
            child: Text(
              args.title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'RobotoCondensed',
              ),
            ),
          ),
          // IntrinsicHeight( // Removido pois bugava o widget INK
          // child:
          Row(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      PostScreen.routeName,
                      arguments: args,
                    );
                  },
                  child: Stack(
                    children: <Widget>[
                      ImageFormatter(
                        height: 400,
                        image: args.videoPreview,
                      ),
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: UserHeader(
                                avatar: args.avatar,
                                userName: args.userName,
                                isVerified: args.isVerified),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //
              //   SECOND COLUMN
              //
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.more_vert,
                          color: mainGrey,
                        ),
                        IconWithLabel(
                          icon: Icons.favorite_border,
                          label: FlutterMoneyFormatter(amount: args.hearts.toDouble())
                              .output
                              .withoutFractionDigits,
                        ),
                        IconWithLabel(
                          icon: OMIcons.modeComment,
                          label: FlutterMoneyFormatter(amount: args.comments.toDouble())
                              .output
                              .withoutFractionDigits,
                        ),
                        Wrap(
                          alignment: WrapAlignment.spaceAround,
                          spacing: 5, // gap between adjacent chips
                          runSpacing: 4, // gap between lines
                          children: <Tag>[
                            for (var tag in args.tags)
                              Tag(
                                tag,
                                onPressed: () {},
                              )
                          ],
                        ),
                        ActionButton(
                          Icons.reply,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Divider(
              color: greyDivider,
            ),
          ),
        ],
      ),
    );
  }
}
