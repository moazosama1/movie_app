import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/color_app.dart';
import 'package:movie_app/core/widgets/list_screen.dart';
import 'package:movie_app/core/widgets/list_tab_bar.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_tab_bar.dart';
import 'package:movie_app/feature/home/presentation/view_model/provider/main_provider.dart';
import 'package:provider/provider.dart';

class WatchedListBody extends StatelessWidget {
  const WatchedListBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var provider = Provider.of<MainProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      child: DefaultTabController(
        length: tabWatchList.length,
        child: SafeArea(
            child: Stack(
          children: [
            CustomTabBar(
              onTap: provider.customControlWatchListTap,
              tabs: tabWatchList,
              tabAlignment: TabAlignment.fill,
            ),
            watchListScreenTab[provider.initialIndexWatchListTap],
          ].reversed.toList(),
        )),
      ),
    );
  }
}
