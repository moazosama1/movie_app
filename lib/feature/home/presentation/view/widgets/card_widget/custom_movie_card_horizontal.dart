import 'package:flutter/material.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/core/widgets/custom_rating_movie.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';
import 'package:movie_app/feature/home/presentation/view/movie_details_view.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_card_image_widget.dart';

class CustomMovieCardHorizontal extends StatelessWidget {
  const CustomMovieCardHorizontal({
    super.key,
    required this.previewItemModel,
  });
  final PreviewItemModel? previewItemModel;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MovieDetailsView.routeName, arguments: previewItemModel);
      },
      child: SizedBox(
        height: 145,
        child: Row(
          children: [
            CustomImageCardWidget(
              imagePath: previewItemModel?.posterPath ?? "",
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
                    previewItemModel?.title ?? "",
                    style: theme.textTheme.titleSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomRatingMovie(
                        rating: previewItemModel?.voteAverage,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      Text(
                        CustomFunction.gitReleaseDate(
                            releaseDate: previewItemModel?.releaseDate ??
                                previewItemModel?.firstAirDate)!,
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
