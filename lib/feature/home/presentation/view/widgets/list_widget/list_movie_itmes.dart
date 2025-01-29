import 'package:flutter/material.dart';

class ListOfMovieItems extends StatelessWidget {
  const ListOfMovieItems({super.key, required this.movieItme, required this.itmeHeight});
  final Widget movieItme;
  final double itmeHeight ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itmeHeight,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => movieItme,
          separatorBuilder: (context, index) => SizedBox(
                width: 8,
              ),
          itemCount: 20),
    );
  }
}
