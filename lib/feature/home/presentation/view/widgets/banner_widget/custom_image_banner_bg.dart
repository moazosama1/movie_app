import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_button_details_movie.dart';

class CustomBannerImageBg extends StatelessWidget {
  const CustomBannerImageBg({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Container(
      height: mediaQueryHeight * .45,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        opacity: 0.5,
        image: AssetImage(imagePath),
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            height: mediaQueryHeight * 0.2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0, 0.4, 1],
                colors: [
                  theme.colorScheme.surfaceContainerLow,
                  theme.colorScheme.surfaceContainerLow.withValues(alpha: 0.55),
                  Colors.transparent,
                ],
              ),
            ),
            child: CustomButtonDetailsMovie(),
          ),
        ],
      ),
    );
  }
}
