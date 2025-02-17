import 'package:flutter/material.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/custom_list_large_items.dart';

class CustomSectionFantasyMovie extends StatelessWidget {
  const CustomSectionFantasyMovie({super.key, this.fantasyListMovies});
  final List<MovieItem>? fantasyListMovies;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Column(
      children: [
        CustomViewMoreMovie(
          title: "Sci-fi & Fantasy",
          itemList: CustomFunction.getPreviewItemMovieListModel(
              movieItem: fantasyListMovies),
        ),
        SizedBox(
          height: 8,
        ),
        CustomListLargeItems(
          listPreviewItems: CustomFunction.getPreviewItemMovieListModel(
              movieItem: fantasyListMovies),
        ),
      ],
    );
  }
}
