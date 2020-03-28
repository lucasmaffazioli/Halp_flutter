import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:halp/components/base_scaffold.dart';
// import 'package:halp/components/image_formatter.dart';
import 'package:halp/components/tag.dart';
import 'package:halp/misc/constants.dart';
import 'package:flutter/services.dart';
import 'package:halp/models/feed_posts_model.dart';
import 'package:halp/screens/post/components/post_card.dart';
import 'package:halp/screens/post/components/post_full_card.dart';

class PostScreen extends StatefulWidget {
  static const routeName = '/post';
  final FeedPostsModel args;
  PostScreen(this.args);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Widget> replies = [Text('Loading...')];
  void asyncFunc() async {
    // FeedPostsModel itemModel;
    // List<Widget> listComments = [Text('Loading...')];
    // List<Widget> listCommentsTemp = [];

    String jsonString =
        await DefaultAssetBundle.of(context).loadString("assets/data/post_details.json");

    List<dynamic> data = jsonDecode(jsonString);
    print('data');
    print(data);
    if (data.length > 0) {
      for (final item in data) {
        print('item');
        print(item);
        // itemModel = new FeedPostsModel(
        //   id: item['id'],
        //   title: item['title'],
        //   userName: item['userName'],
        //   isVerified: item['isVerified'],
        //   comments: item['comments'],
        //   hearts: item['hearts'],
        //   tags: item['tags'].cast<String>(),
        //   avatar: item['avatar'],
        //   videoPreview: item['videoPreview'],
        // );

        // setState(() {
        //   listCommentsTemp.add(
        //       PostFu(itemModel),
        //       );
        // });
      }
    }
    // return Future.delayed(const Duration(milliseconds: 500), () {
    //   setState(() {
    //     setState(() {
    //       listComments.clear();
    //       listComments = listCommentsTemp;
    //     });
    //   });
    // });
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
                      ],
                    ),
                  ),
                ),
                Column(
                  children: replies,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
