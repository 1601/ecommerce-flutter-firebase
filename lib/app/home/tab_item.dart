import 'package:flutter/material.dart';
import 'package:ecommerce_flutter_firebase/constants/keys.dart';
import 'package:ecommerce_flutter_firebase/constants/strings.dart';

enum TabItem { map, menu, account }

class TabItemData {
  const TabItemData(
      {@required this.key, @required this.title, @required this.icon});

  final String key;
  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.map: TabItemData(
      key: Keys.mapTab,
      title: Strings.food,
      icon: Icons.fastfood,
    ),
    TabItem.menu: TabItemData(
        key: Keys.menuTab, title: Strings.menu, icon: Icons.view_list),
    TabItem.account: TabItemData(
      key: Keys.accountTab,
      title: Strings.account,
      icon: Icons.person,
    ),
  };
}
