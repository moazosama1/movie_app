import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    return SizedBox(
      height: mediaQueryHeight,
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImagePath.errorImageIcon,
            width: 100,
            color: theme.colorScheme.surface,
          ),
          Text(
            errorMessage,
            style: theme.textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ); // Replace with your desired widget
  }
}
