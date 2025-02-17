import 'package:flutter/material.dart';
import 'package:movie_app/core/api/api_url.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/core/widgets/custom_rating_movie.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';

class CustomSeasonCard extends StatelessWidget {
  const CustomSeasonCard(
      {super.key,
      this.previewItemModel,
      required this.itemWidth,
      required this.itemHeight,
      required this.textTitleWidth});
  final PreviewItemModel? previewItemModel;
  final double itemWidth;
  final double itemHeight;
  final double textTitleWidth;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Container(
      width: itemWidth,
      height: itemHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: (previewItemModel?.posterPath != null)
              ? NetworkImage(ApiUrl.getImageFullPath(
                  imagePath: previewItemModel?.posterPath)!)
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
                          previewItemModel?.title ?? "",
                          style: theme.textTheme.labelSmall!
                              .copyWith(color: theme.colorScheme.surface),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Text(
                          CustomFunction.gitReleaseDate(
                              releaseDate: previewItemModel?.releaseDate ??
                                  previewItemModel?.firstAirDate)!,
                          style: theme.textTheme.labelSmall!.copyWith(
                              fontSize: 12, color: theme.colorScheme.tertiary)),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomRatingMovie(
                      rating: previewItemModel?.voteAverage ?? 0,
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
    );
  }
}
