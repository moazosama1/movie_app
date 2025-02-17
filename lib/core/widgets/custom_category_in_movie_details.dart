import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_details.dart';

class CustomCategoryInMovieDetails extends StatelessWidget {
  const CustomCategoryInMovieDetails({
    super.key,
    required this.previewItemDetailsModel,
  });
  final PreviewItemDetailsModel? previewItemDetailsModel;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 30,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              color: theme.colorScheme.tertiary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              previewItemDetailsModel?.genres?[index].name ?? "",
              style: theme.textTheme.labelSmall,
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        itemCount: previewItemDetailsModel?.genres?.length ?? 0,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
