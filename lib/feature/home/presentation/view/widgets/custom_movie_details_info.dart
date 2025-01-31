import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/core/widgets/custom_category_in_movie_details.dart';
import 'package:movie_app/core/widgets/custom_rating_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_card_coming_soon.dart';

class CustomMovieDetailsInfo extends StatelessWidget {
  const CustomMovieDetailsInfo({
    super.key,
  });

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
          child: CustomCardComingSoon(imagePath: ImagePath.tMoviePosterImage),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Never Let Go",
                style: theme.textTheme.titleMedium,
              ),
              Text(
                "As an evil takes over the world beyond their front doorstep, the only protection for a mother and her twin sons is their house and their family’s protective bond.",
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
                    "2024",
                    style: theme.textTheme.labelSmall!
                        .copyWith(color: theme.colorScheme.tertiary),
                  ),
                  CustomRatingMovie(
                    rating: 6.3,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              CustomCategoryInMovieDetails()
            ],
          ),
        ),
      ],
    );
  }
}
