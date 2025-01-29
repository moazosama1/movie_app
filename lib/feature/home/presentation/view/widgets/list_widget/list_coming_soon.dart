import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_card_coming_soon.dart';

class CustomListComingSoon extends StatelessWidget {
  const CustomListComingSoon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 8,
        ),
        itemBuilder: (context, index) => CustomCardComingSoon(
          imagePath: ImagePath.tCommingSoonImage,
        ),
        itemCount: 20,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
