import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/data/model/movie_details_model/movie_details_model/movie_details_model.dart';

class CustomCategoryInMovieDetails extends StatelessWidget {
  const CustomCategoryInMovieDetails({
    super.key,
    required this.movieDetails,
  });
  final MovieDetailsModel? movieDetails;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 30,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              color: theme.colorScheme.tertiary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              movieDetails?.genres?[index].name ?? "",
              style: theme.textTheme.labelSmall,
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        itemCount: movieDetails?.genres?.length ?? 0,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
