import 'package:flutter/material.dart';

const List<Widget> tab = [
  Tab(
    text: "For You",
  ),
  Tab(
    text: "Movies",
  ),
  Tab(
    text: "TV Show",
  ),
];
const List<Widget> tabWatchList = [
  Tab(
    text: "Movie",
  ),
  Tab(
    text: "Tv Show",
  ),
  Tab(
    text: "Account",
  ),
];
List<Widget> categoryTabs = List.generate(
  20,
  (index) => Tab(
    text: "Action",
  ),
);
