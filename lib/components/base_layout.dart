import 'package:flutter/material.dart';
import 'package:halp/misc/constants.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class BaseLayout extends StatelessWidget {
  final Widget body;
  BaseLayout({@required this.body});

  @override
  Widget build(BuildContext context) {
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
        body: body,
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
                backgroundImage: AssetImage('assets/images/mockup_jake_avatar.jpg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
