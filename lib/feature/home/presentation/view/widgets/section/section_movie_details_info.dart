import 'package:flutter/material.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/core/widgets/custom_category_in_movie_details.dart';
import 'package:movie_app/core/widgets/custom_rating_movie.dart';

import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_details.dart';

import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_card_image_widget.dart';

class SectionMovieDetailsInfo extends StatelessWidget {
  const SectionMovieDetailsInfo({
    super.key,
    required this.previewItemModel,
  });
  final PreviewItemDetailsModel? previewItemModel;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      spacing: 16,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: theme.colorScheme.surface, width: 1.2)),
          child: CustomImageCardWidget(imagePath: previewItemModel?.posterPath),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                previewItemModel?.title ?? "",
                style: theme.textTheme.titleMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                previewItemModel?.overview ?? "",
                style: theme.textTheme.labelSmall!,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    CustomFunction.gitReleaseDate(
                        releaseDate: previewItemModel?.releaseDate)!,
                    style: theme.textTheme.labelSmall!
                        .copyWith(color: theme.colorScheme.tertiary),
                  ),
                  CustomRatingMovie(
                    rating: previewItemModel?.voteAverage,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              CustomCategoryInMovieDetails(
                previewItemDetailsModel: previewItemModel,
              )
            ],
          ),
        ),
      ],
    );
  }
}
