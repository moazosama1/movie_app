import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/core/widgets/custom_button_app.dart';
import 'package:movie_app/core/widgets/custom_rating_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_bonner_movie_details.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_card_coming_soon.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_movie_card_horizontal.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_movie_details_info.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/list_movie_items.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Stack(
      children: [
        Stack(
          children: [
            CustomBonnerMovieDetailsImage(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: mediaQueryHeight * 0.16,
                  ),
                  CustomMovieDetailsInfo(),
                  SizedBox(
                    height: 16,
                  ),
                  CustomButtonActionMovieDetailsInfo(),
                  SizedBox(
                    height: 16,
                  ),
                  CustomViewMoreMovie(title: "More Like This"),
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 8,
                      ),
                      itemBuilder: (context, index) =>
                          CustomMovieCardHorizontal(
                        date: "2024",
                        imagePath: ImagePath.tMovieCardImage,
                        rating: 5.5,
                        title: "Tucker And Dale Vs Evil",
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: 14,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomButtonActionMovieDetailsInfo extends StatelessWidget {
  const CustomButtonActionMovieDetailsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButtonApp(
            color: theme.colorScheme.primary,
            title: "play",
            icon: Icons.play_arrow_outlined),
        CustomButtonApp(
            color: theme.colorScheme.secondary,
            title: "Add to List",
            icon: Icons.add)
      ],
    );
  }
}
