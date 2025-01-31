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
List<Widget> categoryTabs = List.generate(
  20,
  (index) => Tab(
    text: "Action",
  ),
);
