import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/list_tab_bar.dart';

class CustomTabBar extends StatelessWidget {
  CustomTabBar({super.key, this.onTap});

  void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return TabBar(
      onTap: onTap,
      tabs: tab,
      labelColor: theme.colorScheme.surface,
      unselectedLabelColor: theme.colorScheme.surface,
      indicatorColor: theme.colorScheme.primaryContainer,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
      dividerHeight: 0.7,
      dividerColor: theme.colorScheme.outline,
    );
  }
}
