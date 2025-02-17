import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card_horizontal.dart';

class CustomListLikeMoreItems extends StatelessWidget {
  const CustomListLikeMoreItems({
    super.key,
    required this.previewItemList,
  });
  final List<PreviewItemModel>? previewItemList;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.only(
            bottom: 8,
            left: 16,
            right: 16,
          ),
          child: CustomMovieCardHorizontal(
              previewItemModel: previewItemList?[index]),
        ),
        childCount:
            previewItemList != null ? (previewItemList!.length ~/ 3) : 0,
      ),
    );
  }
}
