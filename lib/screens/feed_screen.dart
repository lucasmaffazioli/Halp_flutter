import 'package:flutter/material.dart';
import 'package:halp/components/post_feed.dart';
import 'package:halp/components/tag.dart';
// import 'package:halp/components/video_block_widget.dart';
import 'package:halp/misc/constants.dart';
import 'package:halp/misc/enum_tag_colors.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:halp/models/login_model.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _currentUser = Provider.of<LoginModel>(
      context,
      listen: false,
    ).getCurrentUser();
    print('current user is ' + _currentUser);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: mainPurple,
          accentColor: secundaryPurple,
          cursorColor: secundaryPurple,
          fontFamily: mainFont,
          // backgroundColor: mainWhite,
          appBarTheme: AppBarTheme(elevation: 3),
          scaffoldBackgroundColor: mainWhite),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: mainWhite,
          brightness: Brightness.light,
          // elevation: ,
          title: Text(
            'HALP.',
            style: TextStyle(
              color: Colors.black,
              fontFamily: mainFont,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        //
        //
        //   BODY
        //
        //
        body: ListView(
          children: <Widget>[
            PostFeed(
                title: 'Como ficar bonitão em uma rave?',
                userName: 'Ayaki Nanami',
                imagePreview: Image.asset('assets/images/mockup_video_Ayaki.jpg'),
                comments: 2,
                hearts: 25),
            PostFeed(
                title: 'Como ter mais inscritos no YouTube?',
                userName: 'Jape Paul',
                imagePreview: Image.asset('assets/images/mockup_video_Jake.jpg'),
                comments: 88,
                hearts: 1930),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(OMIcons.home),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(OMIcons.addBox),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              CircleAvatar(
                maxRadius: 16,
                minRadius: 16,
                backgroundImage: NetworkImage(
                    'https://instagram.fcxj3-1.fna.fbcdn.net/v/t51.2885-19/s150x150/61833265_363511360967887_3520754021616844800_n.jpg?_nc_ht=instagram.fcxj3-1.fna.fbcdn.net&_nc_ohc=fmx_BBx_UxIAX-pgWva&oh=50a38600d596a7b24ca6958672f42fde&oe=5EA14E2B'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
