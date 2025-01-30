import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_movie_card_large.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/list_movie_itmes.dart';

class CustomSectionSeriesMovie extends StatelessWidget {
  const CustomSectionSeriesMovie({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuaryHeight = MediaQuery.of(context).size.height;
    var mediaQuaryWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CustomViewMoreMovie(
          title: "Series",
          onTap: () {},
        ),
        SizedBox(
          height: 8,
        ),
        ListOfMovieItems(
          itmeHeight: mediaQuaryHeight * 0.15,
          movieItme: CustomMovieCardLarge(
            imagePath: ImagePath.tCoverItemLImage,
            title: "Mean Girls",
            date: 2024,
            rating: 5.9,
            itemHeight: mediaQuaryHeight * 0.15,
            itmeWidth: mediaQuaryWidth * 0.5,
          ),
        ),
      ],
    );
  }
}
