import 'package:flutter/material.dart';

class CustomTextOnboarding extends StatelessWidget {
  const CustomTextOnboarding({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Container(
      height: mediaQueryHeight * 0.20,
      color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: theme.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            Text(subTitle,
                style: theme.textTheme.labelSmall!
                    .copyWith(fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
