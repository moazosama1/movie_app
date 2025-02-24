import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movie_app/core/function/custom_favorite_function.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card_horizontal.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/saved_item/saved_cubit.dart';

class CustomSaveItemCardHorizontal extends StatelessWidget {
  const CustomSaveItemCardHorizontal(
      {super.key, required this.previewItemModel});
  final PreviewItemModel? previewItemModel;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = BlocProvider.of<SavedCubit>(context);
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) async {
              await cubit.deleteItemsToFavorite(
                  addFavoriteModel: previewItemModel?.firstAirDate == null
                      ? CustomFavoriteFunction.deleteMovieItem(
                          movieId: previewItemModel?.id ?? 0)
                      : CustomFavoriteFunction.deleteTvShoeItem(
                          tvId: previewItemModel?.id ?? 0));
              await cubit.getWatchNewAllData();
            },
            backgroundColor: theme.colorScheme.secondary,
            foregroundColor: Colors.white,
            icon: Icons.delete_outline_rounded,
            label: 'Delete',
            borderRadius: BorderRadius.circular(8),
          ),
        ],
      ),
      child: CustomMovieCardHorizontal(
        previewItemModel: previewItemModel,
      ), // Ensure this widget is defined
    );
  }
}
