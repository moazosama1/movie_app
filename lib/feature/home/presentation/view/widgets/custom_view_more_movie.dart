import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomViewMoreMovie extends StatelessWidget {
   CustomViewMoreMovie({
    super.key,
    required this.title,
    this.onTap
  });

  final String title;
  void Function()? onTap;
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
          onPressed: onTap,
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
