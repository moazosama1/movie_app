import 'package:flutter/material.dart';

class CustomCardComingSoon extends StatelessWidget {
  const CustomCardComingSoon({super.key, required this.imagePath , this.aspectRatio});
  final String imagePath;
  final double? aspectRatio;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio:aspectRatio ?? 1.9 / 3,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            )));
  }
}
