import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/banner_widget/custom_banner_movie_details.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card_horizontal.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_button_details_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_movie_details_info.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/movie_details/cubit/movie_details_cubit.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        switch (state) {
          case MovieDetailsInitial():
            return SizedBox();
          case MovieDetailsSuccess():
            return CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      CustomBannerMovieDetailsImage(
                        imagePath: state.movieDetailsModel?.backdropPath,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            SizedBox(
                              height: mediaQueryHeight * 0.16,
                            ),
                            CustomMovieDetailsInfo(
                              movieItem: state.movieDetailsModel,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            CustomButtonDetailsMovie(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              iconTitle: Icons.play_arrow_outlined,
                              title: "Play",
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            CustomViewMoreMovie(
                              title: "More Like This",
                              movieList: state.movieSimilar,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                        left: 16,
                        right: 16,
                      ),
                      child: CustomMovieCardHorizontal(
                        movieItem: state.movieSimilar?[index],
                      ),
                    ),
                    childCount: state.movieSimilar?.length ?? 0,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 8,
                  ),
                ),
              ],
            );
          case MovieDetailsLoading():
            return SizedBox(
                height: 230, child: Center(child: CircularProgressIndicator()));
          case MovieDetailsFailure():
            return Center(
                child: SizedBox(
              child: Text(
                state.errorMessage,
                style: theme.textTheme.titleMedium,
              ),
            ));
        }
      },
    );
  }
}
