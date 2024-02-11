import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class NavigatorItem {
  final String label;
  final String iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
  NavigatorItem("Shop", "assets/icons/shop_icon.svg", 0, HomeScreen()),
  NavigatorItem("Explore", "assets/icons/explore_icon.svg", 1, HomeScreen()),
  NavigatorItem("Cart", "assets/icons/cart_icon.svg", 2, HomeScreen()),
  NavigatorItem(
      "Favourite", "assets/icons/favourite_icon.svg", 3, HomeScreen()),
  NavigatorItem("Account", "assets/icons/account_icon.svg", 4, HomeScreen()),
];
