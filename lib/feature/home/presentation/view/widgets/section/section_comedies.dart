import 'package:flutter/material.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/custom_list_items.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/custom_list_small_items.dart';

class CustomSectionComediesMovie extends StatelessWidget {
  const CustomSectionComediesMovie(
      {super.key, this.comediesTopRatedListMovies, this.comediesListMovies});
  final List<MovieItem>? comediesTopRatedListMovies;
  final List<MovieItem>? comediesListMovies;

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);

    return Column(
      children: [
        CustomViewMoreMovie(
          title: "Comedies",
          itemList: CustomFunction.getPreviewItemMovieListModel(
              movieItem: (comediesTopRatedListMovies ?? []) +
                  (comediesListMovies ?? [])),
        ),
        SizedBox(
          height: 8,
        ),
        CustomListSmallList(
            previewItems: CustomFunction.getPreviewItemMovieListModel(
                movieItem: comediesTopRatedListMovies)),
        SizedBox(
          height: 8,
        ),
        CustomListItems(
          previewItemList: CustomFunction.getPreviewItemMovieListModel(
              movieItem: comediesListMovies),
        )
      ],
    );
  }
}
