import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/presentation/view/movie_details_view.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card_large.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/movie_list/movie_list_cubit.dart';

class CustomSectionComediesMovie extends StatelessWidget {
  const CustomSectionComediesMovie({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
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
                  title: "Comedies",
                  movieList: state.childrenListMovies,
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: mediaQueryHeight * 0.15,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CustomMovieCardLarge(
                            textTitleWidth: 120,
                            itemHeight: mediaQueryHeight * 0.17,
                            itemWidth: mediaQueryWidth * 0.5,
                            movieItem: state.comediesTopRatedListMovies?[index],
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 8,
                          ),
                      itemCount: state.comediesTopRatedListMovies?.length ?? 0),
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
                            movieItem: state.comediesListMovies?[index],
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 8,
                          ),
                      itemCount: state.comediesListMovies?.length ?? 0),
                ),
              ],
            );
          case MovieListLoading():
            return SizedBox(
              height: mediaQueryHeight * .45,
              width: double.infinity,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case MovieListFailure():
            return SizedBox(
              height: mediaQueryHeight * .45,
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
