import 'package:flutter/material.dart';
import 'package:movie_app/core/api/api_url.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/core/widgets/custom_shadow.dart';

class CustomBannerMovieDetailsImage extends StatelessWidget {
  const CustomBannerMovieDetailsImage({super.key, required this.imagePath});
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: mediaQueryHeight * .35,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: imagePath != null
                  ? NetworkImage(ApiUrl.getImageFullPath(imagePath: imagePath)!)
                  : AssetImage(ImagePath.errorImage),
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
