import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/custom_rating_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_card_coming_soon.dart';

class CustomMovieCardHorizontal extends StatelessWidget {
  const CustomMovieCardHorizontal({
    super.key, required this.title, required this.imagePath, required this.date, required this.rating,
  });
  final String title;
  final String imagePath;
  final String date;
  final double rating;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 180,
      child: Row(
        children: [
          CustomCardComingSoon(
            imagePath: imagePath,
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
                  title,
                  style: theme.textTheme.titleSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomRatingMovie(
                      rating: rating,
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    Text(
                      date,
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
    );
  }
}
