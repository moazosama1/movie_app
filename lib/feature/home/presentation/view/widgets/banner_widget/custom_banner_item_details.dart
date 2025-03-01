import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/api/api_url.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/core/widgets/custom_shadow.dart';
import 'package:shimmer/shimmer.dart';

class CustomBannerItemDetailsImage extends StatelessWidget {
  const CustomBannerItemDetailsImage({super.key, required this.imagePath});
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: mediaQueryHeight * .35,
          child: imagePath != null && imagePath!.isNotEmpty
              ? CachedNetworkImage(
                  imageUrl: ApiUrl.getImageFullPath(imagePath: imagePath)!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade800,
                    highlightColor: Colors.grey.shade600,
                    child: Container(
                      width: double.infinity,
                      height: mediaQueryHeight * .35,
                      color: Colors.black,
                    ),
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    ImagePath.errorImage,
                    fit: BoxFit.cover,
                  ),
                )
              : Image.asset(
                  ImagePath.errorImage,
                  fit: BoxFit.cover,
                ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomShadow(
            height: mediaQueryHeight * .18,
          ),
        ),
      ],
    );
  }
}
