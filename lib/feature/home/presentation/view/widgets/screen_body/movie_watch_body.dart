import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/error/custom_error_widget.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_save_item_card_horizontal.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/saved_item/saved_cubit.dart';
class MovieWatchBody extends StatelessWidget {
  const MovieWatchBody({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return BlocBuilder<SavedCubit, SavedState>(
      builder: (context, state) {
        switch (state) {
          case SavedInitial():
            // TODO: Handle this case.
            throw UnimplementedError();
          case SavedSuccess():
            return Padding(
              padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
              child: SizedBox(
                height: mediaQueryHeight,
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: false,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Text(
                        "Movie Saved..",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 12)),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return SizedBox(
                            height: 140,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: CustomSaveItemCardHorizontal(
                                previewItemModel:
                                    CustomFunction.getPreviewItemMovieModel(
                                        movieItem: state.movieSaved?[index]),
                              ),
                            ),
                          );
                        },
                        childCount: state.movieSaved?.length ?? 0,
                      ),
                    ),
                  ],
                ),
              ),
            );
          case SavedLoading():
            return Center(
              child: SizedBox(
                height: 230,
                child: Center(child: CircularProgressIndicator()),
              ),
            );
          case SavedFailure():
            return CustomErrorWidget(
              errorMessage: state.errorMessage,
            );
        }
      },
    );
  }
}
