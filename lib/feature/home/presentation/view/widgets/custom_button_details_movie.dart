import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/custom_button_app.dart';

class CustomButtonDetailsMovie extends StatelessWidget {
  CustomButtonDetailsMovie(
      {super.key,
      this.mainAxisAlignment,
      required this.title,
      this.onTapDetails,
      required this.iconTitle});
  final MainAxisAlignment? mainAxisAlignment;
  final String title;
  final IconData iconTitle;
  void Function()? onTapDetails;
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
          title: title,
          color: theme.colorScheme.primary,
          icon: iconTitle,
          onTap: onTapDetails,
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
