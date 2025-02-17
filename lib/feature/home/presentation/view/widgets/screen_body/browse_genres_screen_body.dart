import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/error/custom_error_widget.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/custom_list_items.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/custom_list_large_items.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_banner_widget.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/browse/browse_cubit.dart';

class BrowseGenresScreenBody extends StatelessWidget {
  const BrowseGenresScreenBody({
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
                CustomBannerWidget(
                  isMovie: true,
                  movieListItems: state.trendingMoviesList,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      CustomViewMoreMovie(
                        title: "Trending",
                        itemList: CustomFunction.getPreviewItemMovieListModel(
                            movieItem: state.trendingMoviesList),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomListItems(
                        previewItemList:
                            CustomFunction.getPreviewItemMovieListModel(
                                movieItem: state.trendingMoviesList),
                      ),
                      CustomListItems(
                        previewItemList:
                            CustomFunction.getPreviewItemMovieListModel(
                                movieItem: state.listMovies),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomViewMoreMovie(
                        title: "Latest Releases",
                        itemList: CustomFunction.getPreviewItemMovieListModel(
                            movieItem: state.lastReleaseList),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomListLargeItems(
                          listPreviewItems:
                              CustomFunction.getPreviewItemMovieListModel(
                                  movieItem: state.lastReleaseList)),
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
            return CustomErrorWidget(
              errorMessage: state.errorMessage,
            );
        }
      },
    );
  }
}
