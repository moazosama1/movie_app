import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/core/widgets/custom_shadow.dart';

class CustomBannerMovieDetailsImage extends StatelessWidget {
  const CustomBannerMovieDetailsImage({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: mediaQueryHeight * .3,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImagePath.tMovieBgImage),
              fit: BoxFit.cover,
              opacity: 0.7)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomShadow(
            height: mediaQueryHeight * .18,
          ),
        ],
      ),
    );
  }
}
