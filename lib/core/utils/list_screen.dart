import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/color_app.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/home_body_for_you.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_screen/home_body.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_screen/search_body.dart';

final List<Widget> screen = [
  HomeBody(),
  SearchBody(
    color: ColorApp.secondaryColor,
  ),
  SearchBody(
    color: Colors.limeAccent,
  ),
  SearchBody(
    color: Colors.deepOrange,
  ),
];
final List<Widget> screenTab = [
  HomeBodyForYou(),
  SearchBody(
    color: Colors.deepPurpleAccent,
  ),
  SearchBody(
    color: Colors.deepOrange,
  ),
];
