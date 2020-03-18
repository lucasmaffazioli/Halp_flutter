import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter/material.dart';
import 'package:halp/components/action_button.dart';
import 'package:halp/components/base_scaffold.dart';
import 'package:halp/components/icon_label.dart';
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
                      children: <Widget>[
                        Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      IconLabel(
                                        horizontal: true,
                                        icon: Icons.favorite_border,
                                        label: FlutterMoneyFormatter(amount: hearts.toDouble())
                                            .output
                                            .withoutFractionDigits,
                                      ),
                                      IconLabel(
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
                          ),
                        ),
                        Card(
                          child: Wrap(
                            alignment: WrapAlignment.spaceAround,
                            spacing: 5, // gap between adjacent chips
                            runSpacing: 4, // gap between lines
                            children: <Tag>[
                              for (var tag in tags)
                                Tag(
                                  tag,
                                  onPressed: () {},
                                )
                            ],
                          ),
                          // ActionButton(
                          //   Icons.reply,
                          //   onPressed: () {},
                          // ),
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
