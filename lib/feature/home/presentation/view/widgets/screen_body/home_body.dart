import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/list_screen.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_tab_bar.dart';
import 'package:movie_app/feature/home/presentation/view_model/provider/main_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/widgets/list_tab_bar.dart';

// ignore: must_be_immutable
class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var provider = Provider.of<MainProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      child: DefaultTabController(
        length: tab.length,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Stack(
            children: [
              CustomTabBar(
                onTap: provider.customControlHomeTap,
                tabs: tab,
                tabAlignment: TabAlignment.fill,
              ),
              screenTab[provider.initialIndexHomeTap],
            ].reversed.toList(),
          ),
        )),
      ),
    );
  }
}
