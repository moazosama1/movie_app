import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/banner_widget/custom_banner_movie_details.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card_horizontal.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_season_card.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_movie_details_info.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_button_details_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/tv_details/tv_show_details_cubit.dart';

class TvShowDetailsBody extends StatelessWidget {
  const TvShowDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);

    return BlocBuilder<TvShowDetailsCubit, TvShowDetailsState>(
      builder: (context, state) {
        switch (state) {
          case TvShowDetailsInitial():
            // TODO: Handle this case.
            throw UnimplementedError();
          case TvShowDetailsLoading():
            return SizedBox(
                height: 230, child: Center(child: CircularProgressIndicator()));
          case TvShowDetailsSuccess():
            return CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      CustomBannerMovieDetailsImage(
                        imagePath: state.tvShowDetailsModel?.backdropPath,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            SizedBox(
                              height: mediaQueryHeight * 0.16,
                            ),
                            CustomMovieDetailsInfo(
                              previewItemModel: CustomFunction
                                  .getPreviewItemTvShowDetailsModel(
                                      tvShowItem: state.tvShowDetailsModel),
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
                              title: "seasons",
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              height: mediaQueryHeight * 0.15,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      CustomSeasonCard(
                                          textTitleWidth: mediaQueryWidth * 0.3,
                                          itemHeight: mediaQueryHeight * 0.15,
                                          itemWidth: mediaQueryWidth * 0.5,
                                          previewItemModel: CustomFunction
                                              .getPreviewSeasonTvShowModel(
                                                  seasonTvShow: state
                                                      .tvShowDetailsModel
                                                      ?.seasons?[index])),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        width: 8,
                                      ),
                                  itemCount: state.tvShowDetailsModel?.seasons
                                          ?.length ??
                                      0),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            CustomViewMoreMovie(
                              title: "More Like This",
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
                        previewItemModel:
                            CustomFunction.getPreviewItemTvShowModel(
                                tvItem: state.similarTvList?[index]),
                      ),
                    ),
                    childCount: state.similarTvList?.length ?? 0,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 8,
                  ),
                ),
              ],
            );
          case TvShowDetailsFailure():
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
