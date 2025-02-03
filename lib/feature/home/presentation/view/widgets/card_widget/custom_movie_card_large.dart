import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/custom_rating_movie.dart';

class CustomMovieCardLarge extends StatelessWidget {
  const CustomMovieCardLarge({
    super.key,
    required this.title,
    required this.date,
    required this.rating,
    required this.itemWidth,
    required this.itemHeight,
    required this.imagePath,
    this.onTap,
  });
  final String title;
  final int date;
  final double rating;
  final double itemWidth;
  final double itemHeight;
  final String imagePath;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: itemWidth,
        height: itemHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imagePath),
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
                        Text(title, style: theme.textTheme.labelSmall),
                        Text("$date",
                            style: theme.textTheme.labelSmall!.copyWith(
                                fontSize: 12,
                                color: theme.colorScheme.tertiary)),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomRatingMovie(
                        rating: rating,
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
