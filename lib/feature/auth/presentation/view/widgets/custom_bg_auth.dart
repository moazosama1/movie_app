import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';

class CustomBgAuth extends StatelessWidget {
  const CustomBgAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);

    return Container(
      height: mediaQueryHeight * .7,
      decoration: BoxDecoration(
        image: DecorationImage(
            opacity: 0.5,
            image: AssetImage(ImagePath.bgAuthImage),
            fit: BoxFit.cover),
      ),
      child: Container(
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
          )),
    );
  }
}
