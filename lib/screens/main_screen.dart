import 'package:flutter/material.dart';
// import 'package:halp/components/base_scaffold.dart';
import 'package:halp/components/bottom_navigation.dart';
import 'package:halp/misc/constants.dart';
import 'package:halp/screens/feed/feed_screen.dart';
import 'package:halp/screens/post/post_screen.dart';
import 'package:halp/screens/profile/profile_screen.dart';

enum TabItem {
  feed,
  search,
  post,
  profile,
}

Map<TabItem, String> tabRoute = {
  TabItem.feed: 'feed',
  TabItem.search: 'search',
  TabItem.post: 'post',
  TabItem.profile: 'profile',
};

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TabItem _currentTab = TabItem.feed;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.feed: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
    TabItem.post: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    print('_selectTab');
    print(tabItem);
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    // _currentUser = loginModel.getCurrentUser();
    // bool isUserLogged = _currentUser.isNotEmpty;
    bool isUserLogged = true;

    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.feed) {
            // select 'main' tab
            _selectTab(TabItem.feed);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.feed),
          _buildOffstageNavigator(TabItem.search),
          _buildOffstageNavigator(TabItem.post),
          _buildOffstageNavigator(TabItem.profile),
          // _buildOffstageNavigator(TabItem.profile),
        ]),
        appBar: AppBar(
          automaticallyImplyLeading: false, // Don't show the leading button that creates apding
          backgroundColor: mainWhite,
          brightness: Brightness.light,
          elevation: 4,
          title: Text(
            'HALP.',
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontFamily: mainFont,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        bottomNavigationBar: !isUserLogged
            ? null
            : BottomNavigation(
                currentTab: _currentTab,
                onSelectTab: _selectTab,
              ),
      ),
    );
  }

  // MaterialPageRoute _routesBuilder(tabItem){
  //   switch (tabItem) {
  //     case TabItem.feed:

  //       break;
  //     default:
  //   }
  // }
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print('generateRoute');
    print(settings);
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FeedScreen());
      case '/feed':
        return MaterialPageRoute(builder: (_) => FeedScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case '/post':
        return MaterialPageRoute(builder: (_) => PostScreen(settings.arguments));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    print('_buildOffstageNavigator');
    print(_currentTab);
    print(tabItem);
    print('Should hide');
    print(_currentTab != tabItem);

    return Offstage(
      offstage: _currentTab != tabItem,
      // child: tabItem == TabItem.feed ? FeedScreen() : ProfileScreen(),
      child: Navigator(
        key: _navigatorKeys[tabItem],
        initialRoute: '/' + tabRoute[tabItem],
        onGenerateRoute: generateRoute,
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return BaseScaffold(
  //     body: Text('test'),
  //     currentTab: _currentTab,
  //     onSelectTab: _selectTab,
  //   );
  // }
}
