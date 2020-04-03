import 'package:flutter/material.dart';
import 'package:halp/misc/constants.dart';
import 'package:halp/screens/main/main_screen.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

// Map<TabItem, String> tabName = {
//   TabItem.feed: 'feed',
//   TabItem.profile: 'profile',
//   TabItem.newPost: 'newPost',
//   TabItem.search: 'search',
// };

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
              icon: Icon(
                OMIcons.home,
                size: 28,
              ),
              color: _colorTabMatching(TabItem.feed, context),
              onPressed: () {
                onSelectTab(
                  TabItem.values[0],
                );
              }),
          IconButton(
            icon: Icon(
              Icons.search,
              size: 28,
            ),
            color: _colorTabMatching(TabItem.search, context),
            onPressed: () {
              onSelectTab(
                TabItem.values[1],
              );
            },
          ),
          IconButton(
            icon: Icon(
              OMIcons.addBox,
              size: 28,
            ),
            color: _colorTabMatching(TabItem.newPost, context),
            onPressed: () {
              onSelectTab(
                TabItem.values[2],
              );
            },
          ),
          // IconButton(
          //   icon: Icon(Icons.favorite_border),
          //     color: _colorTabMatching(TabItem., context),
          //   onPressed: () {
          //     onSelectTab(
          //       TabItem.values[3],
          //     );
          //   },
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 9),
            child: GestureDetector(
              onTap: () {
                onSelectTab(
                  TabItem.values[3],
                );
              },
              child: CircleAvatar(
                // TODO https://github.com/flutter/flutter/issues/24824
                maxRadius: 16,
                minRadius: 16,
                backgroundImage: AssetImage('assets/images/mockup_jake_avatar.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _colorTabMatching(TabItem item, context) {
    return currentTab == item ? mainPurple : Colors.grey;
  }
}
// class BottomNavigation extends StatelessWidget {
//   BottomNavigation({this.currentTab, this.onSelectTab});
//   final TabItem currentTab;
//   final ValueChanged<TabItem> onSelectTab;

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       showSelectedLabels: false,
//       showUnselectedLabels: false,
//       backgroundColor: mainWhite,
//       type: BottomNavigationBarType.fixed,
//       items: [
//         BottomNavigationBarItem(
//             icon: Icon(OMIcons.home, color: _colorTabMatching(TabItem.feed, context)),
//             title: Text('null')),
//         BottomNavigationBarItem(
//             icon: Icon(OMIcons.search, color: _colorTabMatching(TabItem.search, context)),
//             title: Text('null')),
//         BottomNavigationBarItem(
//             icon: Icon(OMIcons.addBox, color: _colorTabMatching(TabItem.newPost, context)),
//             title: Text('null')),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_border, color: _colorTabMatching(TabItem.profile, context)),
//             title: Text('null'))
//       ],
//       onTap: (index) => onSelectTab(
//         TabItem.values[index],
//       ),
//     );
//   }

//   Color _colorTabMatching(TabItem item, context) {
//     return currentTab == item ? mainPurple : Colors.grey;
//   }
// }
