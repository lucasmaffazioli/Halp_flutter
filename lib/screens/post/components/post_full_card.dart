import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:halp/components/icon_with_label.dart';
import 'package:halp/components/user_header_block.dart';
import 'package:halp/misc/constants.dart';
import 'package:halp/models/posts_header_model.dart';
import 'package:halp/screens/post/components/post_card.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class PostFullCard extends StatelessWidget {
  // const PostFullCard({
  //   Key key,
  //   @required this.avatar,
  //   @required this.userName,
  //   @required this.title,
  //   @required this.hearts,
  //   this.comments = 0,
  //   this.isReply = false,
  //   this.child,
  // }) : super(key: key);

  // final String avatar;
  // final String userName;
  // final String title;
  // final int hearts;
  // final int comments;
  final bool isReply;
  final Widget child;

  final PostHeaderModel args;
  PostFullCard(this.args, {this.child, this.isReply});

  @override
  Widget build(BuildContext context) {
    return PostCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              UserHeader(
                avatar: args.avatar,
                userName: args.userName,
                isVerified: args.isVerified,
                isReply: true,
              ),
              Spacer(),
              Icon(
                Icons.more_vert,
                color: mainGrey,
              ),
            ],
          ),
          if (child != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
              child: child,
            ),
          SizedBox(
            height: 12,
          ),
          Text(
            args.title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 26,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconWithLabel(
                  horizontal: true,
                  icon: Icons.favorite_border,
                  label: FlutterMoneyFormatter(amount: args.hearts.toDouble())
                      .output
                      .withoutFractionDigits,
                ),
                isReply
                    ? Container()
                    : IconWithLabel(
                        horizontal: true,
                        icon: OMIcons.modeComment,
                        label: FlutterMoneyFormatter(amount: args.comments.toDouble())
                            .output
                            .withoutFractionDigits,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
