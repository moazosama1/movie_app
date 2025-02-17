import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card_large.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/movie_list/movie_list_cubit.dart';

class CustomSectionActionMovie extends StatelessWidget {
  const CustomSectionActionMovie({super.key});

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
                    state.topRatedMovies?.length ?? 0,
                    (index) => CustomMovieCardLarge(
                      textTitleWidth: 150,
                      itemHeight: mediaQueryHeight * 0.2,
                      itemWidth: mediaQueryWidth * 0.9,
                      previewItemModel: CustomFunction.getPreviewItemMovieModel(
                          movieItem: state.topRatedMovies?[index]),
                    ),
                  ),
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
                                    movieItem: state.actionListMovies?[index]),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 8,
                          ),
                      itemCount: state.actionListMovies?.length ?? 0),
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
