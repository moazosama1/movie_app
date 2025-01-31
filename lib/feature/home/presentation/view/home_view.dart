import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/button_nav_bar_item.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/core/widgets/list_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const String routeName = kHomeView;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        currentIndex: currentIndex,
        items: [
          customButtonNavBarItem(
              theme: theme, imagePath: ImagePath.homeIcon, label: "HOME"),
          customButtonNavBarItem(
              theme: theme, imagePath: ImagePath.browseIcon, label: "BROWSE"),
          customButtonNavBarItem(
              theme: theme, imagePath: ImagePath.searchIcon, label: "SEARCH"),
          customButtonNavBarItem(
              theme: theme,
              imagePath: ImagePath.bookMarkIcon,
              label: "WATCH-LIST"),
        ],
      ),
    );
  }
}
