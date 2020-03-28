import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:halp/components/icon_with_label.dart';
import 'package:halp/misc/constants.dart';
import 'package:halp/screens/post/components/post_card.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class PostFullCard extends StatelessWidget {
  const PostFullCard({
    Key key,
    @required this.avatar,
    @required this.userName,
    @required this.title,
    @required this.hearts,
    this.comments = 0,
    this.isReply = false,
    this.child,
  }) : super(key: key);

  final String avatar;
  final String userName;
  final String title;
  final int hearts;
  final int comments;
  final bool isReply;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PostCard(
      child: Column(
        children: <Widget>[
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                  // backgroundImage: avatar,
                  ),
              SizedBox(
                width: 10,
              ),
              Text(
                userName,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  // shadows: [
                  //   Shadow(
                  //     blurRadius: 10,
                  //     color: Colors.blue,
                  //     offset: Offset(0, 3.0),
                  //   ),
                  // ],
                  color: mainBlack,
                ),
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
            title,
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
                  label:
                      FlutterMoneyFormatter(amount: hearts.toDouble()).output.withoutFractionDigits,
                ),
                isReply
                    ? Container()
                    : IconWithLabel(
                        horizontal: true,
                        icon: OMIcons.modeComment,
                        label: FlutterMoneyFormatter(amount: comments.toDouble())
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
