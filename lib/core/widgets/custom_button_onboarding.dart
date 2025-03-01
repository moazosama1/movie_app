import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtonOnboarding extends StatelessWidget {
  CustomButtonOnboarding({super.key, this.onTap, required this.title});
  void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: mediaQueryWidth,
        margin: EdgeInsets.symmetric(horizontal: 16),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: theme.colorScheme.primary,
        ),
        child: Center(
          child: Text(
            title,
            style: theme.textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
