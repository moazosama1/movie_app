import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';
import 'package:movie_app/feature/home/presentation/view/more_movie_view.dart';

// ignore: must_be_immutable
class CustomViewMoreMovie extends StatelessWidget {
  const CustomViewMoreMovie({super.key, required this.title, this.itemList});

  final String title;
  final List<PreviewItemModel>? itemList;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.labelLarge!
              .copyWith(color: theme.colorScheme.surface),
        ),
        TextButton(
          onPressed: () {
            if (itemList!.isNotEmpty) {
              Navigator.pushNamed(context, MoreMovieView.routeName,
                  arguments: itemList);
            }
          },
          child: Text(
            "View All",
            style: theme.textTheme.labelSmall!
                .copyWith(color: theme.colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
