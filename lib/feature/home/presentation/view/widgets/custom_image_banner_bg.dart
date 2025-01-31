import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_button_banner.dart';

class CustomBannerImageBg extends StatelessWidget {
  const CustomBannerImageBg({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Container(
      height: mediaQueryHeight * .45,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        opacity: 0.5,
        image: AssetImage(imagePath),
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [CustomButtonBanner()],
      ),
    );
  }
}

