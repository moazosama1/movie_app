import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';

class CustomSplashBg extends StatelessWidget {
  const CustomSplashBg({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagePath.splashScreenImage),
                fit: BoxFit.cover,
                opacity: .8)),
        child: child);
  }
}
