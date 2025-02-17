import 'package:flutter/material.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/presentation/view/movie_details_view.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_card_image_widget.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_view_more_movie.dart';

class CustomSectionComingSoonMovie extends StatelessWidget {
  const CustomSectionComingSoonMovie({super.key, required this.movieListItems});
  final List<MovieItem>? movieListItems;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        CustomViewMoreMovie(
          title: "Coming Soon",
          itemList: CustomFunction.getPreviewItemMovieListModel(
              movieItem: movieListItems),
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 230,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              width: 8,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(MovieDetailsView.routeName,
                    arguments: CustomFunction.getPreviewItemMovieModel(
                        movieItem: movieListItems?[index]));
              },
              child: CustomImageCardWidget(
                imagePath: movieListItems?[index].posterPath,
              ),
            ),
            itemCount: movieListItems?.length ?? 0,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
