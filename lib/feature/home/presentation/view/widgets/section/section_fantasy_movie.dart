import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/movie_list/movie_list_cubit.dart';

class CustomSectionFantasyMovie extends StatelessWidget {
  const CustomSectionFantasyMovie({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return BlocBuilder<MovieListCubit, MovieListState>(
      builder: (context, state) {
        switch (state) {
          case MovieListInitial():
            // TODO: Handle this case.
            throw UnimplementedError();
          case MovieListSuccess():
            return Column(
              children: [
                CustomViewMoreMovie(
                  title: "Sci-fi & Fantasy",
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 250,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          CustomMovieCardImageNetwork(
                            previewItemModel:
                                CustomFunction.getPreviewItemMovieModel(
                              movieItem: state.fantasyListMovies?[index],
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 8,
                          ),
                      itemCount: state.fantasyListMovies?.length ?? 0),
                ),
              ],
            );
          case MovieListLoading():
            return SizedBox(
              height: 200,
              width: double.infinity,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case MovieListFailure():
            return SizedBox(
              height: 300,
              width: double.infinity,
              child: Center(
                child: Text(
                  state.errorMessage,
                  style: theme.textTheme.labelLarge,
                ),
              ),
            );
        }
      },
    );
  }
}
