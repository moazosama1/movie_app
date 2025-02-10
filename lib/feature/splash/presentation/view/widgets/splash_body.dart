import 'package:flutter/material.dart';

import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/feature/splash/presentation/view/widgets/custom_splash_bg.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSplashBg(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset(
              ImagePath.logoApp2Image,
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
    );
  }
}
