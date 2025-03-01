import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/core/error/custom_error_widget.dart';
import 'package:movie_app/core/shimmer/loading/custom_widget_loading.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_comedies.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_banner_widget.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_action_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_children.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_coming_soon.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_fantasy_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_series.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/for_you_list/for_you_list_cubit.dart';

class HomeForYouBody extends StatelessWidget {
  const HomeForYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return BlocBuilder<ForYouListCubit, ForYouListState>(
      builder: (context, state) {
        switch (state) {
          case ForYouListInitial():
            // TODO: Handle this case.
            throw UnimplementedError();
          case ForYouListSuccess():
            return Column(
              children: [
                CustomBannerWidget(
                  movieListItems: state.topRatedMovies,
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      CustomSectionComingSoonMovie(
                        movieListItems: state.upcomingListMovies,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomSectionActionMovie(
                        actionListMovies: state.actionListMovies,
                        topRatedMovies: state.topRatedMovies,
                      ),
                      CustomSectionComediesMovie(
                        comediesListMovies: state.comediesListMovies,
                        comediesTopRatedListMovies:
                            state.comediesTopRatedListMovies,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomSectionTwoItemsMovie(
                        title: "Children & Family",
                        childrenListMovies: state.childrenListMovies,
                        familyMovies: state.familyMovies,
                      ),
                      CustomSectionSeriesMovie(
                        seriesTvShowList: state.seriesTvShowList,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomSectionFantasyMovie(
                        fantasyListMovies: state.fantasyListMovies,
                      ),
                    ],
                  ),
                )
              ],
            );
          case ForYouListLoading():
            return CustomWidgetLoading();
          case ForYouListFailure():
            return CustomErrorWidget(
              errorMessage: state.errorMessage,
            );
        }
      },
    );
  }
}
