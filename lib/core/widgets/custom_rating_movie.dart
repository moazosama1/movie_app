import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/image_path.dart';

class CustomRatingMovie extends StatelessWidget {
  const CustomRatingMovie(
      {super.key,
      required this.rating,
      this.sizeIcon,
      this.sizeFont,
      this.mainAxisAlignment});

  final double rating;
  final double? sizeIcon;
  final double? sizeFont;
  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      spacing: 5,
      children: [
        SvgPicture.asset(
          ImagePath.ratingIcon,
          width: sizeIcon ?? 18,
        ),
        Text(
          "$rating",
          style: theme.textTheme.labelMedium!.copyWith(
              color: theme.colorScheme.surface, fontSize: sizeFont ?? 18),
        )
      ],
    );
  }
}
