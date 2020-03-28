import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:halp/components/base_scaffold.dart';
import 'package:halp/screens/feed/components/feed_post.dart';
import 'package:halp/models/login_model.dart';
import 'package:provider/provider.dart';
// import 'package:halp/services/getPosts.dart';

class FeedScreen extends StatefulWidget {
  static const routeName = '/feed';

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  String testText = '';
  List<Widget> listPosts = [Text('Loading...')];
  List<Widget> listPostsTemp = [];

  void asyncFunc() async {
    String jsonString =
        await DefaultAssetBundle.of(context).loadString("assets/data/feed_posts.json");
    Map<String, dynamic> data = jsonDecode(jsonString);
    // final jsonResult = json.decode(data);

    print('aaaaaaaaa');
    print(data);

    List posts = data['posts'];

    print('posts');
    // print(posts);

    if (posts.length > 0) {
      for (final item in posts) {
        print('item');
        print('$item');
        print(item['tags']);
        setState(() {
          listPostsTemp.add(
            FeedPost(
              id: item['id'],
              title: item['title'],
              userName: item['userName'],
              isVerified: item['isVerified'],
              comments: item['comments'],
              hearts: item['hearts'],
              tags: item['tags'].cast<String>(),
              avatar: item['avatar'],
              videoPreview: item['videoPreview'],
            ),
          );
        });
      }
    }

    print('listPosts');
    print(listPosts);

    return Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        setState(() {
          listPosts.clear();
          listPosts = listPostsTemp;
          // listPosts
        });
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
        // children: <Widget>[
        //   Text(testText),
        //   FeedPost(
        //       id: 0,
        //       title: 'Como ficar bonitão em uma rave?',
        //       userName: 'Ayaki Nanami',
        //       imagePreview: 'assets/images/mockup_video_Ayaki.jpg',
        //       imageAvatar: AssetImage('assets/images/mockup_ayaki_avatar.png'),
        //       tags: ['Rave', 'Moda', 'Lifestyle'],
        //       comments: 2,
        //       hearts: 25),
        //   FeedPost(
        //       id: 1,
        //       title: 'Como ter mais inscritos no YouTube?',
        //       userName: 'Jake Paul',
        //       imagePreview: 'assets/images/mockup_video_Jake.jpg',
        //       imageAvatar: AssetImage('assets/images/mockup_jake_avatar.jpg'),
        //       tags: ['YouTube', 'Empreendedorismo'],
        //       comments: 88,
        //       hearts: 1930),
        //   FeedPost(
        //       id: 2,
        //       title: 'Devo casar com ela?!',
        //       userName: 'Jake Paul',
        //       imagePreview: 'assets/images/mockup_video_Jake_2.jpg',
        //       imageAvatar: AssetImage('assets/images/mockup_jake_avatar.jpg'),
        //       tags: ['Popstar', 'Casamento', 'Dicas pessoais'],
        //       comments: 50,
        //       hearts: 1201),
        // ],
      ),
    );
  }
}
