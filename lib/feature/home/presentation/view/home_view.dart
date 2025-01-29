import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/buttom_nav_bar_item.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/core/utils/list_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const String routeName = kHomeView;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currnetIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: sceren[currnetIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          currnetIndex = value;
          setState(() {});
        },
        currentIndex: currnetIndex,
        items: [
          customButtomNavBarItem(
              theme: theme, imagePath: ImagePath.homeIcon, lable: "HOME"),
          customButtomNavBarItem(
              theme: theme, imagePath: ImagePath.browseIcon, lable: "BROWSE"),
          customButtomNavBarItem(
              theme: theme, imagePath: ImagePath.searchIcon, lable: "SEARCH"),
          customButtomNavBarItem(
              theme: theme,
              imagePath: ImagePath.bookMarkIcon,
              lable: "WATCHLIST"),
        ],
      ),
    );
  }
}
