import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_category_screen_item.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/home_body_for_you.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/screen_body/browse_body.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/screen_body/home_body.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/screen_body/search_body.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/screen_body/watched_list_body.dart';

final List<Widget> screen = [
  HomeBody(),
  BrowseBody(),
  SearchBody(),
  WatchedListBody(),
];
final List<Widget> screenTab = [
  HomeBodyForYou(),
  WatchedListBody(),
  WatchedListBody(),
];
List<Widget> screenCategoryTab = List.generate(
  20,
  (index) {
    return index % 2 == 0 ? CustomCategoryScreenItem() : WatchedListBody();
  },
);
