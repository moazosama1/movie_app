import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/error/custom_error_widget.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/core/shimmer/list/custom_list_item_saved_shimmer.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/core/widgets/custom_initial_screen.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_save_item_card_horizontal.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/saved_item/saved_cubit.dart';

class TvShowWatchBody extends StatelessWidget {
  const TvShowWatchBody({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    var cubit = BlocProvider.of<SavedCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
      child: SizedBox(
        height: mediaQueryHeight,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                "Tv Show Saved..",
                style: theme.textTheme.titleMedium,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            BlocBuilder<SavedCubit, SavedState>(
              builder: (context, state) {
                switch (state) {
                  case SavedInitial():
                    return SliverToBoxAdapter(
                      child: CustomInitialScreen(
                          imagePath: ImagePath.savedResultImage),
                    );
                  case SavedSuccess():
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return SizedBox(
                            height: 140,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: CustomSaveItemCardHorizontal(
                                previewItemModel:
                                    CustomFunction.getPreviewItemTvShowModel(
                                        tvItem: state.tvShowSaved?[index]),
                              ),
                            ),
                          );
                        },
                        childCount: state.tvShowSaved?.length ?? 0,
                      ),
                    );
                  case SavedLoading():
                    return CustomListItemSavedShimmer(
                      count: cubit.tvShowSaved?.length ?? 0,
                    );
                  case SavedFailure():
                    return CustomErrorWidget(
                      errorMessage: state.errorMessage,
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
