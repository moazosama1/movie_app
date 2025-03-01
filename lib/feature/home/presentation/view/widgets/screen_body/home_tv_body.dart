import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/error/custom_error_widget.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/core/shimmer/loading/custom_widget_loading.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/custom_list_items.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/custom_list_large_items.dart';
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
                        itemList: CustomFunction.getPreviewItemListTvShowModel(
                            tvItem: state.tvAiringTodayList),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomListItems(
                        previewItemList:
                            CustomFunction.getPreviewItemListTvShowModel(
                                tvItem: state.tvTrendingList),
                      ),
                      CustomViewMoreMovie(
                        title: "Popular",
                        itemList: CustomFunction.getPreviewItemListTvShowModel(
                            tvItem: state.tvList),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomListItems(
                        previewItemList:
                            CustomFunction.getPreviewItemListTvShowModel(
                                tvItem: state.tvList),
                      ),
                      CustomViewMoreMovie(
                        title: "Airing Today",
                        itemList: CustomFunction.getPreviewItemListTvShowModel(
                            tvItem: state.tvAiringTodayList),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomListLargeItems(
                        listPreviewItems:
                            CustomFunction.getPreviewItemListTvShowModel(
                                tvItem: state.tvAiringTodayList),
                      )
                    ],
                  ),
                )
              ],
            );
          case TvListLoading():
            return CustomWidgetLoading();
          case TvListFailure():
            return CustomErrorWidget(
              errorMessage: state.errorMessage,
            );
        }
      },
    );
  }
}
