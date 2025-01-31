import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/list_coming_soon.dart';

class CustomSectionComingSoonMovie extends StatelessWidget {
  const CustomSectionComingSoonMovie({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuaryHeight = MediaQuery.of(context).size.height;
    var mediaQuaryWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CustomViewMoreMovie(
          title: "Coming Soon",
          onTap: () {},
        ),
        SizedBox(
          height: 8,
        ),
        CustomListComingSoon(),
      ],
    );
  }
}
