import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/custom_button_app.dart';

class CustomButtonDetailsMovie extends StatelessWidget {
  const CustomButtonDetailsMovie({super.key, required, this.mainAxisAlignment});
  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceEvenly,
      children: [
        CustomButtonApp(
          title: "Play",
          color: theme.colorScheme.primary,
          icon: Icons.play_arrow_outlined,
          onTap: () {},
        ),
        CustomButtonApp(
          title: "Add to List",
          color: theme.colorScheme.secondary,
          icon: Icons.add,
          onTap: () {},
        ),
      ],
    );
  }
}
