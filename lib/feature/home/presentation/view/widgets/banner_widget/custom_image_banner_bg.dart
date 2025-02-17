import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/api/api_url.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';
import 'package:movie_app/feature/home/presentation/view/movie_details_view.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_button_details_movie.dart';

class CustomBannerImageNetworkBg extends StatelessWidget {
  const CustomBannerImageNetworkBg({
    super.key,
    required this.previewItem,
  });
  final PreviewItemModel? previewItem;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Container(
      height: mediaQueryHeight * .45,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        opacity: 0.5,
        image: previewItem?.posterPath != null
            ? CachedNetworkImageProvider(
                ApiUrl.getImageFullPath(imagePath: previewItem?.posterPath)!)
            : AssetImage(ImagePath.errorImage),
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
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
            ),
            child: CustomButtonDetailsMovie(
              iconTitle: Icons.details_rounded,
              title: "Details",
              onTapDetails: () {
                Navigator.of(context).pushNamed(MovieDetailsView.routeName,
                    arguments: previewItem);
              },
            ),
          ),
        ],
      ),
    );
  }
}
