import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card_large.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_banner_widget.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/browse/browse_cubit.dart';

class CustomCategoryScreenItem extends StatelessWidget {
  const CustomCategoryScreenItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return BlocBuilder<BrowseCubit, BrowseState>(
      builder: (context, state) {
        switch (state) {
          case BrowseInitial():
            // TODO: Handle this case.
            throw UnimplementedError();
          case BrowseSuccess():
            return Column(
              children: [
                BlocBuilder<BrowseCubit, BrowseState>(
                  builder: (context, state) {
                    switch (state) {
                      case BrowseInitial():
                        // TODO: Handle this case.
                        throw UnimplementedError();
                      case BrowseSuccess():
                        return CustomBannerWidget(
                          isMovie: true,
                          movieListItems: state.trendingMoviesList,
                        );

                      case BrowseLoading():
                        return SizedBox(
                          height: mediaQueryHeight * .4,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      case BrowseFailure():
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      CustomViewMoreMovie(
                        title: "Trending",
                        movieList: state.trendingMoviesList,
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
                                  movieItem: state.trendingMoviesList?[index],
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 8,
                                ),
                            itemCount: state.trendingMoviesList?.length ?? 0),
                      ),
                      SizedBox(
                        height: 250,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                CustomMovieCardImageNetwork(
                                  movieItem: state.listMovies?[index],
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 8,
                                ),
                            itemCount: state.listMovies?.length ?? 0),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomViewMoreMovie(
                        title: "Latest Releases",
                        movieList: state.lastReleaseList,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: mediaQueryHeight * 0.18,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                CustomMovieCardLarge(
                                  movieItem: state.lastReleaseList?[index],
                                  textTitleWidth: 180,
                                  itemWidth: mediaQueryWidth * .7,
                                  itemHeight: 0.16,
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 8,
                                ),
                            itemCount: state.lastReleaseList?.length ?? 0),
                      ),
                    ],
                  ),
                ),
              ],
            );
          case BrowseLoading():
            return SizedBox(
              height: 200,
              width: double.infinity,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case BrowseFailure():
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
