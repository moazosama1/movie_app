import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTabBar extends StatelessWidget {
  CustomTabBar({super.key, this.onTap, required this.tabs, this.isScrollable, required this.tabAlignment});
  final List<Widget> tabs;
  void Function(int)? onTap;
  final bool? isScrollable;
  final TabAlignment tabAlignment;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return TabBar(
      tabAlignment: tabAlignment,
      onTap: onTap,
      tabs: tabs,
      isScrollable: isScrollable ?? false,
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
