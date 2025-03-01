import 'package:flutter/material.dart';

class CustomOnboardingScreen extends StatelessWidget {
  const CustomOnboardingScreen({
    super.key,
    required this.imagePath,
  });
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Container(
      width: mediaQueryWidth,
      height: mediaQueryHeight,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imagePath), fit: BoxFit.cover, opacity: 0.6)),
    );
  }
}
