import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/feature/splash/presentation/view/widgets/custom_splash_bg.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: CustomSplashBg(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      spreadRadius: 20,
                      blurRadius: 100,
                      offset: Offset(0, 6), // changes position of shadow
                    ),
                  ],
                ),
                child: SvgPicture.asset(ImagePath.logoAppSvg))
          ],
        ),
      ),
    );
  }
}
