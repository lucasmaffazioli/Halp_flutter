import 'package:flutter/material.dart';
import 'package:halp/components/base_layout.dart';
import 'package:halp/models/login_model.dart';
import 'package:halp/screens/feed_screen.dart';
import 'package:halp/screens/login.dart';
import 'package:halp/misc/constants.dart';
import 'package:halp/screens/post_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      create: (context) => new LoginModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: mainPurple,
          accentColor: secundaryPurple,
          cursorColor: secundaryPurple,
          fontFamily: mainFont,
          // backgroundColor: mainWhite,
          appBarTheme: AppBarTheme(
            elevation: 3,
          ),
          scaffoldBackgroundColor: mainWhite,
        ),
        // home: BaseLayout(),
        initialRoute: '/',
        routes: {
          '/': (context) => Login(),
          '/feed': (context) => FeedScreen(),
          '/post': (context) => PostScreen(
                postId: ModalRoute.of(context).settings.arguments,
              ),
        },
        // home: Login(),
      ),
    );
  }
}
