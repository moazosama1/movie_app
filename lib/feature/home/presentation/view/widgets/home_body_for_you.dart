import 'package:movie_app/feature/home/presentation/view/widgets/custom_image_banner_bg.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_comedies.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_action_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_children.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_coming_soon.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_fantasy_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_series.dart';

class HomeBodyForYou extends StatelessWidget {
  const HomeBodyForYou({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CustomBannerImageBg(imagePath: ImagePath.tCoverImage),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomSectionComingSoonMovie(),
              SizedBox(
                height: 8,
              ),
              CustomSectionActionMovie(),
              CustomSectionComediesMovie(),
              SizedBox(
                height: 16,
              ),
              CustomSectionTwoItemsMovie(
                title: "Children & Family",
              ),
              CustomSectionSeriesMovie(),
              SizedBox(
                height: 8,
              ),
              CustomSectionFantasyMovie(),
            ],
          ),
        )
      ],
    );
  }
}
