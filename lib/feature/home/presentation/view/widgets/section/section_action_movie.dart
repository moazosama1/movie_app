import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card_large.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/custom_list_items.dart';

class CustomSectionActionMovie extends StatelessWidget {
  const CustomSectionActionMovie(
      {super.key,
      required this.actionListMovies,
      required this.topRatedMovies});
  final List<MovieItem>? actionListMovies;
  final List<MovieItem>? topRatedMovies;
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        CustomViewMoreMovie(
          title: "Action & Adventure",
        ),
        SizedBox(
          height: 8,
        ),
        CarouselSlider(
          options: CarouselOptions(
              height: mediaQueryHeight * 0.2,
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              autoPlay: true),
          items: List.generate(
            topRatedMovies?.length ?? 0,
            (index) => CustomMovieCardLarge(
              textTitleWidth: 150,
              itemHeight: mediaQueryHeight * 0.2,
              itemWidth: mediaQueryWidth * 0.9,
              previewItemModel: CustomFunction.getPreviewItemMovieModel(
                  movieItem: topRatedMovies?[index]),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        CustomListItems(
            previewItemList: CustomFunction.getPreviewItemMovieListModel(
                movieItem: actionListMovies)),
      ],
    );
  }
}
