import 'package:flutter/material.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/custom_list_items.dart';

class CustomSectionTwoItemsMovie extends StatelessWidget {
  const CustomSectionTwoItemsMovie(
      {super.key,
      required this.title,
      this.familyMovies,
      this.childrenListMovies});
  final String title;
  final List<MovieItem>? familyMovies;
  final List<MovieItem>? childrenListMovies;

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);

    return Column(
      children: [
        CustomViewMoreMovie(
          title: title,
          itemList: CustomFunction.getPreviewItemMovieListModel(
              movieItem: (familyMovies ?? []) + (childrenListMovies ?? [])),
        ),
        SizedBox(
          height: 8,
        ),
        CustomListItems(
          previewItemList: CustomFunction.getPreviewItemMovieListModel(
              movieItem: familyMovies),
        ),
        SizedBox(
          height: 8,
        ),
        CustomListItems(
          previewItemList: CustomFunction.getPreviewItemMovieListModel(
              movieItem: childrenListMovies),
        ),
      ],
    );
  }
}
