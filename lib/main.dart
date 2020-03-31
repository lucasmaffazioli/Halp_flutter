import 'package:flutter/material.dart';
import 'package:halp/models/login_model.dart';
import 'package:halp/screens/feed/feed_screen.dart';
import 'package:halp/screens/login/login.dart';
import 'package:halp/misc/constants.dart';
import 'package:halp/screens/post/post_screen.dart';
import 'package:halp/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // final _navigatorKey = GlobalKey<NavigatorState>();

  final bool userLoggedIn = true;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      create: (context) => new LoginModel(),

      // https://pub.dev/packages/provider#reading-a-value

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
        routes: {
          '/': userLoggedIn ? (context) => FeedScreen() : (context) => Login(),
          // '/': (context) => Login(),
          Login.routeName: (context) => Login(),
          FeedScreen.routeName: (context) => FeedScreen(),
          PostScreen.routeName: (context) => PostScreen(ModalRoute.of(context).settings.arguments),
          ProfileScreen.routeName: (context) => ProfileScreen(),
        },
        // home: ProfileScreen(),
      ),
    );
  }
}
