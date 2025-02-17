import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card_large.dart';

class CustomListSmallList extends StatelessWidget {
  const CustomListSmallList({
    super.key,
    required this.previewItems,
  });

  final List<PreviewItemModel>? previewItems;

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return SizedBox(
      height: mediaQueryHeight * 0.15,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CustomMovieCardLarge(
                textTitleWidth: 120,
                itemHeight: mediaQueryHeight * 0.17,
                itemWidth: mediaQueryWidth * 0.5,
                previewItemModel: previewItems?[index],
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 8,
              ),
          itemCount: previewItems?.length ?? 0),
    );
  }
}
