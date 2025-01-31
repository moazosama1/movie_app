import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/list_screen.dart';
import 'package:movie_app/core/widgets/list_tab_bar.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_tab_bar.dart';

// ignore: must_be_immutable
class BrowseBody extends StatefulWidget {
  BrowseBody({super.key});
  int currentIndex = 0;
  @override
  State<BrowseBody> createState() => _BrowseBodyState();
}

class _BrowseBodyState extends State<BrowseBody> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: DefaultTabController(
      length: categoryTabs.length,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CustomTabBar(
                  onTap: (value) {
                    widget.currentIndex = value;
                    setState(() {});
                  },
                  tabs: categoryTabs,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                ),
                screenCategoryTab[widget.currentIndex]
              ].reversed.toList(),
            ),
          ],
        ),
      ),
    ));
  }
}
