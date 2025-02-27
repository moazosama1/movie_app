import 'package:flutter/material.dart';
import 'package:movie_app/core/api/api_url.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/core/widgets/custom_rating_movie.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';
import 'package:movie_app/feature/home/presentation/view/movie_details_view.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_card_image_widget.dart';

class CustomMovieBasicCard extends StatelessWidget {
  const CustomMovieBasicCard({
    super.key,
    this.previewItemModel,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 190,
                child: CustomImageCardWidget(
                  imagePath: ApiUrl.getImageFullPath(
                      imagePath: previewItemModel?.posterPath),
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
                  child:
                      CustomRatingMovie(rating: previewItemModel?.voteAverage),
                ),
              )
            ],
          ),
          SizedBox(
            width: 130,
            child: Text(
              (previewItemModel?.title ?? previewItemModel?.originalName) ?? "",
              style: theme.textTheme.labelMedium!
                  .copyWith(color: theme.colorScheme.surface),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Text(
            CustomFunction.gitReleaseDate(
                releaseDate: previewItemModel?.releaseDate ??
                    previewItemModel?.firstAirDate)!,
            style: theme.textTheme.labelSmall!
                .copyWith(color: theme.colorScheme.tertiary),
          ),
        ],
      ),
    );
  }
}
