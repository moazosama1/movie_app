import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card_large.dart';

class CustomListLargeItems extends StatelessWidget {
  const CustomListLargeItems({
    super.key,
    required this.listPreviewItems,
  });

  final List<PreviewItemModel>? listPreviewItems;

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return SizedBox(
      height: mediaQueryHeight * 0.17,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CustomMovieCardLarge(
              itemHeight: mediaQueryHeight * 0.17,
              textTitleWidth: 160,
              itemWidth: mediaQueryWidth * 0.7,
              previewItemModel: listPreviewItems?[index]),
          separatorBuilder: (context, index) => SizedBox(
                width: 8,
              ),
          itemCount: listPreviewItems?.length ?? 0),
    );
  }
}
