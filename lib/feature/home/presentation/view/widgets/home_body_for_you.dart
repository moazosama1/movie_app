import 'package:movie_app/feature/home/presentation/view/widgets/secion/section_comedies.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_banner_bg.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/secion/section_action_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/secion/section_children.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/secion/section_coming_soon.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/secion/section_fantasy_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/secion/section_series.dart';

class HomeBodyForYou extends StatelessWidget {
  const HomeBodyForYou({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuaryHeight = MediaQuery.of(context).size.height;
    var mediaQuaryWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: mediaQuaryHeight * .45,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            opacity: 0.5,
            image: AssetImage(ImagePath.tCoverImage),
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [CustomBannerBg()],
          ),
        ),
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
              CustomSectionChildrenMovie(),
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
