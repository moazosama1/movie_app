import 'package:flutter/material.dart';

class CustomCategoryInMovieDetails extends StatelessWidget {
  const CustomCategoryInMovieDetails({
    super.key,
  });

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
              "Action",
              style: theme.textTheme.labelSmall,
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        itemCount: 20,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
