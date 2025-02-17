import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/data/model/tv_show_list_model/tv_show_item.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/banner_widget/custom_image_banner_bg.dart';

class CustomBannerWidget extends StatelessWidget {
  const CustomBannerWidget({
    super.key,
    this.isMovie = true,
    this.movieListItems,
    this.tvListItems,
  });
  final bool isMovie;
  final List<MovieItem>? movieListItems;
  final List<TvShowItemModel>? tvListItems;
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return CarouselSlider(
      options: CarouselOptions(
        height: mediaQueryHeight * .54,
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
      ),
      items: List.generate(
        isMovie ? movieListItems?.length ?? 0 : tvListItems?.length ?? 0,
        (index) => CustomBannerImageNetworkBg(
          previewItem: movieListItems != null
              ? CustomFunction.getPreviewItemMovieModel(
                  movieItem: movieListItems?.reversed.toList()[index])
              : CustomFunction.getPreviewItemTvShowModel(
                  tvItem: tvListItems?.reversed.toList()[index]),
        ),
      ),
    );
  }
}
