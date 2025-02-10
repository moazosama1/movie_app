import 'package:flutter/material.dart';
import 'package:movie_app/core/api/api_url.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/core/widgets/custom_rating_movie.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/presentation/view/movie_details_view.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_card_image_widget.dart';

class CustomMovieCard extends StatelessWidget {
  const CustomMovieCard({
    super.key,
    required this.date,
    required this.title,
    required this.rating,
    required this.imagePath,
    this.onTap,
  });

  final String title;
  final String? date;
  final double rating;
  final String imagePath;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 190,
                child: CustomCardComingSoon(
                  imagePath: imagePath,
                  aspectRatio: 2.1 / 3,
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  width: 60,
                  height: 28,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  child: CustomRatingMovie(
                    rating: rating,
                  ),
                ),
              )
            ],
          ),
          Text(
            title,
            style: theme.textTheme.labelMedium!
                .copyWith(color: theme.colorScheme.surface),
            overflow: TextOverflow.clip,
            maxLines: 2,
          ),
          Text(
            date ?? "",
            style: theme.textTheme.labelSmall!
                .copyWith(color: theme.colorScheme.tertiary),
          ),
        ],
      ),
    );
  }
}

class CustomMovieCardImageNetwork extends StatelessWidget {
  const CustomMovieCardImageNetwork({
    super.key,
    required this.movieItem,
  });

  final MovieItem? movieItem;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MovieDetailsView.routeName, arguments: movieItem);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 190,
                child: CustomImageCardWidget(
                  imagePath:
                      ApiUrl.getImageFullPath(imagePath: movieItem?.posterPath),
                  aspectRatio: 2.1 / 3,
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  width: 60,
                  height: 28,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  child: CustomRatingMovie(
                    rating: movieItem?.voteAverage,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 130,
            child: Text(
              movieItem?.originalTitle ?? "",
              style: theme.textTheme.labelMedium!
                  .copyWith(color: theme.colorScheme.surface),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Text(
            CustomFunction.gitReleaseDate(releaseDate: movieItem?.releaseDate)!,
            style: theme.textTheme.labelSmall!
                .copyWith(color: theme.colorScheme.tertiary),
          ),
        ],
      ),
    );
  }
}
