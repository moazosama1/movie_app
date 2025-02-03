import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/banner_widget/custom_banner_movie_details.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card_horizontal.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_button_details_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_movie_details_info.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_view_more_movie.dart';

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
            CustomBannerMovieDetailsImage(),
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
                  CustomButtonDetailsMovie(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
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
