import 'package:flutter/material.dart';
import 'package:halp/screens/main_screen.dart';

Map<TabItem, String> tabName = {
  TabItem.feed: 'feed',
  TabItem.profile: 'profile',
  TabItem.post: 'post',
  TabItem.search: 'search',
};

Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.feed: Colors.red,
  TabItem.profile: Colors.green,
  TabItem.post: Colors.green,
  TabItem.search: Colors.brown,
};

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.feed),
        _buildItem(tabItem: TabItem.search),
        _buildItem(tabItem: TabItem.post),
        _buildItem(tabItem: TabItem.profile),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = tabName[tabItem];
    IconData icon = Icons.layers;
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentTab == item ? activeTabColor[item] : Colors.grey;
  }
}
