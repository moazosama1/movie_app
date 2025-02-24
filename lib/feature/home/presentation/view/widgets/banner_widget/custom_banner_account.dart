import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';

class BannerBgAccountInfo extends StatelessWidget {
  const BannerBgAccountInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: mediaQueryHeight * .34,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(ImagePath.previewAccountImage))),
      child: Container(
          width: double.infinity,
          height: mediaQueryHeight * 0.1,
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
          )),
    );
  }
}
