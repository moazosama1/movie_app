import 'package:flutter/material.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/feature/home/data/model/tv_show_list_model/tv_show_item.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/custom_list_small_items.dart';

class CustomSectionSeriesMovie extends StatelessWidget {
  const CustomSectionSeriesMovie({super.key, this.seriesTvShowList});
  final List<TvShowItemModel>? seriesTvShowList;
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);

    return Column(
      children: [
        CustomViewMoreMovie(
          title: "Series",
          itemList: CustomFunction.getPreviewItemListTvShowModel(
              tvItem: seriesTvShowList),
        ),
        SizedBox(
          height: 8,
        ),
        CustomListSmallList(
            previewItems: CustomFunction.getPreviewItemListTvShowModel(
                tvItem: seriesTvShowList)),
      ],
    );
  }
}
