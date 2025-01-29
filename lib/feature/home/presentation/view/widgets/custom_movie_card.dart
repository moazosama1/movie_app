import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/custom_rating_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_card_coming_soon.dart';

class CustomMovieCard extends StatelessWidget {
  const CustomMovieCard({
    super.key,
    required this.date,
    required this.title,
    required this.rating, required this.imagePath,
  });

  final String title;
  final String date;
  final double rating;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Column(
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
        ),
        Text(
          date,
          style: theme.textTheme.labelSmall!
              .copyWith(color: theme.colorScheme.tertiary),
        ),
      ],
    );
  }
}
