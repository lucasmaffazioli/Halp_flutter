import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:halp/components/base_scaffold.dart';
import 'package:halp/models/feed_posts_model.dart';
import 'package:halp/screens/feed/components/feed_post.dart';
import 'package:halp/models/login_model.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  static const routeName = '/feed';

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<Widget> listPosts = [Text('Loading...')];

  void asyncFunc() async {
    FeedPostsModel itemModel;
    List<Widget> listPostsTemp = [];

    String jsonString =
        await DefaultAssetBundle.of(context).loadString("assets/data/posts_feed.json");
    Map<String, dynamic> data = jsonDecode(jsonString);

    List posts = data['posts'];

    if (posts.length > 0) {
      for (final item in posts) {
        itemModel = new FeedPostsModel(
          id: item['id'],
          title: item['title'],
          userName: item['userName'],
          isVerified: item['isVerified'],
          comments: item['comments'],
          hearts: item['hearts'],
          tags: item['tags'].cast<String>(),
          avatar: item['avatar'],
          videoPreview: item['videoPreview'],
        );

        listPostsTemp.add(
          FeedPost(itemModel),
        );
      }
    }
    return Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        listPosts.clear();
        listPosts = listPostsTemp;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    asyncFunc();
  }

  @override
  Widget build(BuildContext context) {
    String _currentUser = Provider.of<LoginModel>(
      context,
      listen: false,
    ).getCurrentUser();
    print('current user is ' + _currentUser);

    return BaseScaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        children: listPosts,
      ),
    );
  }
}
