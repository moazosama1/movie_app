import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card.dart';

class CustomListItems extends StatelessWidget {
  const CustomListItems({
    super.key,
    this.previewItemList,
  });
  final List<PreviewItemModel>? previewItemList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CustomMovieCardImageNetwork(
                previewItemModel: previewItemList?[index],
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 8,
              ),
          itemCount: previewItemList?.length ?? 0),
    );
  }
}
