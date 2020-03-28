import 'package:flutter/material.dart';
import 'package:halp/components/base_scaffold.dart';
import 'package:halp/screens/feed/components/feed_post.dart';
import 'package:halp/models/login_model.dart';
import 'package:provider/provider.dart';
import 'package:halp/services/getPosts.dart';

class FeedScreen extends StatelessWidget {
  static const routeName = '/feed';

  Future<List<Widget>> _getPosts() async {
    Map<String, dynamic> dmap = await getPosts('assets/test.json');
    print(dmap);
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
        // children: _getPosts(),
        children: <Widget>[
          FeedPost(
              id: 0,
              title: 'Como ficar bonitão em uma rave?',
              userName: 'Ayaki Nanami',
              imagePreview: 'assets/images/mockup_video_Ayaki.jpg',
              imageAvatar: AssetImage('assets/images/mockup_ayaki_avatar.png'),
              tags: ['Rave', 'Moda', 'Lifestyle'],
              comments: 2,
              hearts: 25),
          FeedPost(
              id: 1,
              title: 'Como ter mais inscritos no YouTube?',
              userName: 'Jake Paul',
              imagePreview: 'assets/images/mockup_video_Jake.jpg',
              imageAvatar: AssetImage('assets/images/mockup_jake_avatar.jpg'),
              tags: ['YouTube', 'Empreendedorismo'],
              comments: 88,
              hearts: 1930),
          FeedPost(
              id: 2,
              title: 'Devo casar com ela?!',
              userName: 'Jake Paul',
              imagePreview: 'assets/images/mockup_video_Jake_2.jpg',
              imageAvatar: AssetImage('assets/images/mockup_jake_avatar.jpg'),
              tags: ['Popstar', 'Casamento', 'Dicas pessoais'],
              comments: 50,
              hearts: 1201),
        ],
      ),
    );
  }
}
