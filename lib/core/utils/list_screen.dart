import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/color_app.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_screen/home_body.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_screen/search_body.dart';

final List<Widget> sceren = [
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
final List<Widget> scerenTab = [
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
