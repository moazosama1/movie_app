import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/feature/home/presentation/view/movie_details_view.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card_large.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/list_movie_items.dart';

class CustomSectionSeriesMovie extends StatelessWidget {
  const CustomSectionSeriesMovie({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
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
          itemHeight: mediaQueryHeight * 0.15,
          movieItem: CustomMovieCardLarge(
            onTap: () {
              Navigator.pushNamed(context, MovieDetailsView.routeName);
            },
            imagePath: ImagePath.tCoverItemLImage,
            title: "Mean Girls",
            date: 2024,
            rating: 5.9,
            itemHeight: mediaQueryHeight * 0.15,
            itemWidth: mediaQueryWidth * 0.5,
          ),
        ),
      ],
    );
  }
}
