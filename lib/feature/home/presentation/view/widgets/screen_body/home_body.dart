import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/list_screen.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_tab_bar.dart';

import '../../../../../../core/widgets/list_tab_bar.dart';

// ignore: must_be_immutable
class HomeBody extends StatefulWidget {
  HomeBody({super.key});
  int initialIndex = 0;
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: tab.length,
      child: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            CustomTabBar(
              onTap: (value) {
                widget.initialIndex = value;
                setState(() {});
              },
              tabs: tab,
              tabAlignment: TabAlignment.fill,
            ),
            screenTab[widget.initialIndex],
          ].reversed.toList(),
        ),
      )),
    );
  }
}
