import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card_large.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_banner_widget.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/tv_list/tv_list_cubit.dart';

class HomeTvBody extends StatelessWidget {
  const HomeTvBody({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return BlocBuilder<TvListCubit, TvListState>(
      builder: (context, state) {
        switch (state) {
          case TvListInitial():
            // TODO: Handle this case.
            throw UnimplementedError();
          case TvListSuccess():
            return Column(
              children: [
                CustomBannerWidget(
                  isMovie: false,
                  tvListItems: state.tvTrendingList,
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      CustomViewMoreMovie(
                        title: "Trending",
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
                                      CustomFunction.getPreviewItemTvShowModel(
                                          tvItem: state.tvTrendingList?[index]),
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 8,
                                ),
                            itemCount: state.tvTrendingList?.length ?? 0),
                      ),
                      CustomViewMoreMovie(
                        title: "Popular",
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
                                      CustomFunction.getPreviewItemTvShowModel(
                                          tvItem: state.tvList?[index]),
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 8,
                                ),
                            itemCount: state.tvList?.length ?? 0),
                      ),
                      CustomViewMoreMovie(
                        title: "Airing Today",
                        itemList: List.generate(
                          state.tvAiringTodayList?.length ?? 0,
                          (index) {
                            return CustomFunction.getPreviewItemTvShowModel(
                                tvItem: state.tvAiringTodayList?[index]);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: mediaQueryHeight * 0.17,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                CustomMovieCardLarge(
                                    itemHeight: mediaQueryHeight * 0.17,
                                    textTitleWidth: 160,
                                    itemWidth: mediaQueryWidth * 0.7,
                                    previewItemModel: CustomFunction
                                        .getPreviewItemTvShowModel(
                                            tvItem: state
                                                .tvAiringTodayList?[index])),
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 8,
                                ),
                            itemCount:
                                (state.tvAiringTodayList?.length ?? 0) ~/ 2),
                      ),
                    ],
                  ),
                )
              ],
            );
          case TvListLoading():
            return SizedBox(
              height: mediaQueryHeight * .4,
              child: Center(child: CircularProgressIndicator()),
            );

          case TvListFailure():
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
    );
  }
}
