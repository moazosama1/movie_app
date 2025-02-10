import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/custom_rating_movie.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/presentation/view/movie_details_view.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_card_image_widget.dart';

class CustomMovieCardHorizontal extends StatelessWidget {
  const CustomMovieCardHorizontal({
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
      child: SizedBox(
        height: 175,
        child: Row(
          children: [
            CustomImageCardWidget(
              imagePath: movieItem?.posterPath ?? "",
              aspectRatio: 2.1 / 3,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieItem?.originalTitle ?? "",
                    style: theme.textTheme.titleSmall,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomRatingMovie(
                        rating: movieItem?.voteAverage,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      Text(
                        (movieItem?.releaseDate != null &&
                                movieItem!.releaseDate!.length >= 4)
                            ? movieItem!.releaseDate!.substring(0, 4)
                            : "",
                        style: theme.textTheme.labelSmall!
                            .copyWith(color: theme.colorScheme.tertiary),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
