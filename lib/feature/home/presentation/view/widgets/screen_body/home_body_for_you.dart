import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_comedies.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_banner_widget.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_action_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_children.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_coming_soon.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_fantasy_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_series.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/movie_list/movie_list_cubit.dart';

class HomeBodyForYou extends StatelessWidget {
  const HomeBodyForYou({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Column(
      children: [
        BlocBuilder<MovieListCubit, MovieListState>(
          builder: (context, state) {
            switch (state) {
              case MovieListInitial():
                // TODO: Handle this case.
                throw UnimplementedError();
              case MovieListSuccess():
                return CustomBannerWidget(
                  movieListItems: state.topRatedMovies,
                );

              case MovieListLoading():
                return SizedBox(
                  height: mediaQueryHeight * .4,
                  child: Center(child: CircularProgressIndicator()),
                );

              case MovieListFailure():
                return SizedBox(
                  height: mediaQueryHeight * .4,
                  child: Center(
                      child: Text(
                    state.errorMessage,
                    style: theme.textTheme.labelLarge,
                  )),
                );
            }
          },
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomSectionComingSoonMovie(),
              SizedBox(
                height: 8,
              ),
              CustomSectionActionMovie(),
              CustomSectionComediesMovie(),
              SizedBox(
                height: 16,
              ),
              CustomSectionTwoItemsMovie(
                title: "Children & Family",
              ),
              CustomSectionSeriesMovie(),
              SizedBox(
                height: 8,
              ),
              CustomSectionFantasyMovie(),
            ],
          ),
        )
      ],
    );
  }
}
