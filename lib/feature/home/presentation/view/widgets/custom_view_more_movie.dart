import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/presentation/view/more_movie_view.dart';

// ignore: must_be_immutable
class CustomViewMoreMovie extends StatelessWidget {
  CustomViewMoreMovie(
      {super.key,
      required this.title,
      this.isMovie = true,
      required this.movieList});

  final String title;
  bool isMovie;
  List<MovieItem>? movieList;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.labelLarge!
              .copyWith(color: theme.colorScheme.surface),
        ),
        TextButton(
          onPressed: () {
            if (movieList!.isNotEmpty) {
              if (isMovie) {
                Navigator.pushNamed(context, MoreMovieView.routeName,
                    arguments: movieList);
              }
            }
          },
          child: Text(
            "View All",
            style: theme.textTheme.labelSmall!
                .copyWith(color: theme.colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
