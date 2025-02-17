import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/custom_list_small_items.dart';

class CustomListRecommendationsItems extends StatelessWidget {
  const CustomListRecommendationsItems({
    super.key,
    required this.previewItemList,
  });
  final List<PreviewItemModel>? previewItemList;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CustomViewMoreMovie(
              title: "Recommendations", itemList: previewItemList),
          SizedBox(
            height: 8,
          ),
          CustomListSmallList(previewItems: previewItemList),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    ));
  }
}
