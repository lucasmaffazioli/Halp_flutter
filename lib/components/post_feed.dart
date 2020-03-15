import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter/material.dart';
import 'package:halp/components/action_button.dart';
import 'package:halp/components/icon_label.dart';
import 'package:halp/components/tag.dart';
import 'package:halp/misc/constants.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:flutter/services.dart';

class PostFeed extends StatelessWidget {
  final String title;
  final String userName;
  final int hearts;
  final int comments;
  final Image imagePreview;
  final AssetImage imageAvatar;
  final List<String> tags;
  PostFeed(
      {@required this.title,
      @required this.userName,
      @required this.hearts,
      @required this.imagePreview,
      @required this.imageAvatar,
      @required this.tags,
      @required this.comments});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: mainWhite,
    ));
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 26,
              fontFamily: 'RobotoCondensed',
            ),
          ),
          // IntrinsicHeight( // Removido pois bugava o widget INK
          // child:
          Row(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Stack(children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: imagePreview,
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: imageAvatar,
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
                                shadows: [
                                  // Shadow(
                                  //   blurRadius: 2,
                                  //   // color: Color(0xFF8000FF),
                                  //   color: Colors.black,
                                  //   offset: Offset(0, 0),
                                  // ),
                                  Shadow(
                                    blurRadius: 10,
                                    color: Colors.blue,
                                    offset: Offset(0, 3.0),
                                  ),
                                ],
                                color: mainWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              //
              //   SECOND COLUMN
              //
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 450,
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
                        IconLabel(
                          icon: Icons.favorite_border,
                          label: FlutterMoneyFormatter(amount: hearts.toDouble())
                              .output
                              .withoutFractionDigits,
                        ),
                        IconLabel(
                          icon: OMIcons.modeComment,
                          label: FlutterMoneyFormatter(amount: comments.toDouble())
                              .output
                              .withoutFractionDigits,
                        ),
                        Wrap(
                            alignment: WrapAlignment.spaceAround,
                            spacing: 5, // gap between adjacent chips
                            runSpacing: 4, // gap between lines
                            children: <Tag>[
                              for (var tag in tags)
                                Tag(
                                  tag,
                                  onPressed: () {},
                                )
                            ]
                            //   Tag(
                            //     'Rave',
                            //     onPressed: () {},
                            //   ),
                            //   Tag(
                            //     'Moda',
                            //     onPressed: () {},
                            //   ),
                            //   Tag(
                            //     'Lifestyle',
                            //     onPressed: () {},
                            //   ),
                            // ],
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
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Divider(
              color: mainGrey,
            ),
          ),
        ],
      ),
    );
  }
}
