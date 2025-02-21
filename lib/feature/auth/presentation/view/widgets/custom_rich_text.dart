import 'package:flutter/material.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style:
            theme.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w400),
        children: [
          TextSpan(text: "Enjoy The "),
          TextSpan(
            text: "Best",
            style: theme.textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w900, color: theme.colorScheme.primary),
          ),
          TextSpan(text: " Movies and TV shows Out there."),
        ],
      ),
    );
  }
}
