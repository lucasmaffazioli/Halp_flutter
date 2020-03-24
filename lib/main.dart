// import 'package:flutter/material.dart';
// import 'package:halp/models/login_model.dart';
// import 'package:halp/screens/feed_screen.dart';
// import 'package:halp/screens/login.dart';
// import 'package:halp/misc/constants.dart';
// import 'package:provider/provider.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<LoginModel>(
//       create: (context) => new LoginModel(),
//       child: MaterialApp(
//         theme: ThemeData(
//           primaryColor: mainPurple,
//           accentColor: secundaryPurple,
//           cursorColor: secundaryPurple,
//           fontFamily: mainFont,
//         ),
//         initialRoute: '/',
//         routes: {
//           '/': (context) => Login(),
//           '/feed': (context) => FeedScreen(),
//         },
//         // home: Login(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:halp/models/login_model.dart';
import 'package:halp/screens/feed_screen.dart';
import 'package:halp/screens/login.dart';
import 'package:halp/misc/constants.dart';
import 'package:halp/screens/post_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // final _navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
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
        // home: BaseLayout(
        // currentUser: Provider.of<LoginModel>(
        //   context,
        //   listen: false,
        // ).getCurrentUser(),
        //   body: Navigator(
        //     key: _navigatorKey,
        //     initialRoute: '/',
        //     onGenerateRoute: (RouteSettings settings) {
        //       WidgetBuilder builder;
        //       // Manage your route names here
        //       switch (settings.name) {
        //         case '/':
        //           builder = (BuildContext context) => Login();
        //           break;
        //         case '/feed':
        //           builder = (BuildContext context) => FeedScreen();
        //           break;
        //         case '/post':
        //           builder = (BuildContext context) => PostScreen(
        //                 postId: ModalRoute.of(context).settings.arguments,
        //               );
        //           break;
        //         default:
        //           throw Exception('Invalid route: ${settings.name}');
        //       }
        //       // You can also return a PageRouteBuilder and
        //       // define custom transitions between pages
        //       return MaterialPageRoute(
        //         builder: builder,
        //         settings: settings,
        //       );
        //     },
        //   ),
        // ),
        initialRoute: '/',
        routes: {
          '/': (context) => Login(),
          FeedScreen.routeName: (context) => FeedScreen(),
          // '/post': (context) => PostScreen(
          PostScreen.routeName: (context) => PostScreen(
                arguments: ModalRoute.of(context).settings.arguments,
              ),
        },
      ),
    );
  }
}
