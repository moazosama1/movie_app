import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/screen_body/home_for_you_body.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/screen_body/browse_body.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/screen_body/home_body.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/screen_body/home_movie_body.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/screen_body/search_body.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/screen_body/watched_list_body.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/screen_body/home_tv_body.dart';

final List<Widget> screen = [
  HomeBody(),
  BrowseBody(),
  SearchBody(),
  WatchedListBody(),
];
final List<Widget> homeScreenTab = [
  HomeForYouBody(),
  HomeMovieBody(),
  HomeTvBody(),
];
