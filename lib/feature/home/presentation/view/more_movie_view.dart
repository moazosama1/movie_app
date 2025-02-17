import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';

import 'package:movie_app/feature/home/presentation/view/widgets/screen_body/more_movie_body.dart';

class MoreMovieView extends StatelessWidget {
  static const String routeName = kMoreMovieView;
  const MoreMovieView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var previewList =
        ModalRoute.of(context)!.settings.arguments as List<PreviewItemModel>;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Items",
          style: theme.textTheme.titleMedium,
        ),
      ),
      body: MoreMovieBody(
        previewItemModel: previewList,
      ),
    );
  }
}
