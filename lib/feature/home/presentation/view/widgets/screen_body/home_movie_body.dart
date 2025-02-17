import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/error/custom_error_widget.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/custom_list_items.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/custom_list_large_items.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_banner_widget.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_coming_soon.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/movie_list/movie_list_cubit.dart';

class HomeMovieBody extends StatelessWidget {
  const HomeMovieBody({super.key});

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
                CustomBannerWidget(
                  movieListItems: state.topRatedList,
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      CustomViewMoreMovie(
                        title: "Now Playing",
                        itemList: CustomFunction.getPreviewItemMovieListModel(
                            movieItem: state.nowPlayingList),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomListItems(
                        previewItemList:
                            CustomFunction.getPreviewItemMovieListModel(
                                movieItem: state.nowPlayingList),
                      ),
                      CustomViewMoreMovie(
                        title: "Popular",
                        itemList: CustomFunction.getPreviewItemMovieListModel(
                            movieItem: state.popularList),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomListItems(
                        previewItemList:
                            CustomFunction.getPreviewItemMovieListModel(
                                movieItem: state.popularList),
                      ),
                      CustomSectionComingSoonMovie(
                        movieListItems: state.comingSoonList,
                      ),
                      CustomViewMoreMovie(
                        title: "Action Advanced",
                        itemList: CustomFunction.getPreviewItemMovieListModel(
                            movieItem: state.topRatedActionList),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomListLargeItems(
                        listPreviewItems:
                            CustomFunction.getPreviewItemMovieListModel(
                                movieItem: state.topRatedActionList),
                      ),
                    ],
                  ),
                )
              ],
            );
          case MovieListLoading():
            return SizedBox(
              height: mediaQueryHeight * .4,
              child: Center(child: CircularProgressIndicator()),
            );

          case MovieListFailure():
            return CustomErrorWidget(
              errorMessage: state.errorMessage,
            );
        }
      },
    );
  }
}
