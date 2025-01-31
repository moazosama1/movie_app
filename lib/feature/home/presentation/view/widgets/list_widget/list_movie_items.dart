import 'package:flutter/material.dart';

class ListOfMovieItems extends StatelessWidget {
  const ListOfMovieItems(
      {super.key, required this.movieItem, required this.itemHeight, this.axis});
  final Widget movieItem;
  final double itemHeight;
  final Axis? axis;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => movieItem,
          separatorBuilder: (context, index) => SizedBox(
                width: 8,
              ),
          itemCount: 20),
    );
  }
}
