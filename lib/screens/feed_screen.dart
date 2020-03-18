import 'package:flutter/material.dart';
import 'package:halp/components/base_scaffold.dart';
import 'package:halp/components/post_feed.dart';
import 'package:halp/models/login_model.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatelessWidget {
  static const routeName = '/passArguments'; // TODO implement named route

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
        children: <Widget>[
          PostFeed(
              id: 0,
              title: 'Como ficar bonitão em uma rave?',
              userName: 'Ayaki Nanami',
              imagePreview: Image.asset('assets/images/mockup_video_Ayaki.jpg'),
              imageAvatar: AssetImage('assets/images/mockup_ayaki_avatar.png'),
              tags: ['Rave', 'Moda', 'Lifestyle'],
              comments: 2,
              hearts: 25),
          PostFeed(
              id: 1,
              title: 'Como ter mais inscritos no YouTube?',
              userName: 'Jake Paul',
              imagePreview: Image.asset('assets/images/mockup_video_Jake.jpg'),
              imageAvatar: AssetImage('assets/images/mockup_jake_avatar.jpg'),
              tags: ['YouTube', 'Empreendedorismo'],
              comments: 88,
              hearts: 1930),
          PostFeed(
              id: 2,
              title: 'Devo casar com ela?!',
              userName: 'Jake Paul',
              imagePreview: Image.asset('assets/images/mockup_video_Jake_2.jpg'),
              imageAvatar: AssetImage('assets/images/mockup_jake_avatar.jpg'),
              tags: ['Popstar', 'Casamento', 'Dicas pessoais'],
              comments: 50,
              hearts: 1201),
        ],
      ),
    );
  }
}
