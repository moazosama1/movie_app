import 'package:flutter/material.dart';
import 'package:movie_app/core/api/api_url.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/core/widgets/custom_rating_movie.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/data/model/tv_show_list_model/tv_show_item.dart';
import 'package:movie_app/feature/home/presentation/view/movie_details_view.dart';

class CustomMovieCardLarge extends StatelessWidget {
  const CustomMovieCardLarge({
    super.key,
    required this.itemWidth,
    required this.itemHeight,
    this.movieItem,
    required this.textTitleWidth,
    this.isMovie = true,
    this.tvItem,
  });
  final bool isMovie;
  final MovieItem? movieItem;
  final TvShowItemModel? tvItem;
  final double itemWidth;
  final double itemHeight;
  final double textTitleWidth;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        if (isMovie) {
          Navigator.of(context)
              .pushNamed(MovieDetailsView.routeName, arguments: movieItem);
        }
      },
      child: Container(
        width: itemWidth,
        height: itemHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: (isMovie
                    ? movieItem?.backdropPath != null
                    : tvItem?.backdropPath != null)
                ? NetworkImage(ApiUrl.getImageFullPath(
                    imagePath: isMovie
                        ? movieItem?.backdropPath
                        : tvItem?.backdropPath)!)
                : AssetImage(ImagePath.errorImage),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: mediaQueryHeight * 0.06,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                gradient: LinearGradient(colors: [
                  theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  theme.colorScheme.onSurface.withValues(alpha: 0.9),
                ], stops: [
                  0,
                  1
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: textTitleWidth,
                          child: Text(
                            isMovie
                                ? movieItem?.originalTitle ?? ""
                                : tvItem?.originalName ?? "",
                            style: theme.textTheme.labelSmall!
                                .copyWith(color: theme.colorScheme.surface),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Text(
                            CustomFunction.gitReleaseDate(
                                releaseDate: isMovie
                                    ? movieItem?.releaseDate
                                    : tvItem?.firstAirDate)!,
                            style: theme.textTheme.labelSmall!.copyWith(
                                fontSize: 12,
                                color: theme.colorScheme.tertiary)),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomRatingMovie(
                        rating: isMovie
                            ? movieItem?.voteAverage
                            : tvItem?.voteAverage,
                        sizeIcon: 14,
                        sizeFont: 14,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
