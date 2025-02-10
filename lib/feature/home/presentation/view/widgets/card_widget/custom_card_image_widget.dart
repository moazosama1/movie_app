import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/api/api_url.dart';

class CustomCardComingSoon extends StatelessWidget {
  const CustomCardComingSoon(
      {super.key, required this.imagePath, this.aspectRatio});
  final String imagePath;
  final double? aspectRatio;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: aspectRatio ?? 1.9 / 3,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            )));
  }
}

class CustomImageCardWidget extends StatelessWidget {
  const CustomImageCardWidget(
      {super.key, required this.imagePath, this.aspectRatio});
  final String? imagePath;
  final double? aspectRatio;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: aspectRatio ?? 1.9 / 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: ApiUrl.getImageFullPath(imagePath: imagePath)!,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ));
  }
}
