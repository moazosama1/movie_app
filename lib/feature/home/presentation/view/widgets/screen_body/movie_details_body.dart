import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/error/custom_error_widget.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/core/function/custom_function_url.dart';
import 'package:movie_app/core/shimmer/loading/custom_widget_loading.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/banner_widget/custom_banner_item_details.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_button_details_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_movie_details_info.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/custom_list_like_more_items.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/custom_list_recommendations_items.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/movie_details/movie_details_cubit.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/movie_details/movie_details_state.dart';
import 'package:movie_app/feature/home/presentation/view_model/provider/main_provider.dart';
import 'package:provider/provider.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    var provider = Provider.of<MainProvider>(context);
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
                      CustomBannerItemDetailsImage(
                        imagePath: state.movieDetailsModel?.backdropPath,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            SizedBox(
                              height: mediaQueryHeight * 0.16,
                            ),
                            SectionMovieDetailsInfo(
                              previewItemModel: CustomFunction
                                  .getPreviewItemMovieDetailsModel(
                                      movieItemDetails:
                                          state.movieDetailsModel),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            CustomButtonDetailsMovie(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              iconTitle: Icons.play_arrow_outlined,
                              title: "Play",
                              isLoading: provider.isLoading,
                              onTapDetails: () async {
                                provider.customIsLoading();
                                await CustomFunctionUrl.openUrlFunction(context,
                                    urlItem: state.movieDetailsModel?.homepage,
                                    theme: theme,
                                    mediaQueryWidth: mediaQueryWidth);

                                provider.customCancelLoading();
                              },
                              previewItemModel: CustomFunction
                                  .getPreviewItemFromMovieDetailsModel(
                                      movieItem: state.movieDetailsModel),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            CustomViewMoreMovie(
                              title: "More Like This",
                              itemList:
                                  CustomFunction.getPreviewItemMovieListModel(
                                      movieItem: state.movieSimilar),
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
                CustomListLikeMoreItems(
                  previewItemList: CustomFunction.getPreviewItemMovieListModel(
                      movieItem: state.movieSimilar),
                ),
                CustomListRecommendationsItems(
                  previewItemList: CustomFunction.getPreviewItemMovieListModel(
                      movieItem: state.movieRecommendations),
                ),
              ],
            );
          case MovieDetailsLoading():
            return CustomWidgetLoading();
          case MovieDetailsFailure():
            return CustomErrorWidget(
              errorMessage: state.errorMessage,
            );
        }
      },
    );
  }
}
