import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/feature/home/presentation/view/movie_details_view.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_movie_card.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_movie_card_large.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/list_movie_items.dart';

class CustomSectionComediesMovie extends StatelessWidget {
  const CustomSectionComediesMovie({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CustomViewMoreMovie(
          title: "Comedies",
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
            imagePath: ImagePath.tCoverItemSImage,
            title: "Mean Girls",
            date: 2024,
            rating: 5.9,
            itemHeight: mediaQueryHeight * 0.17,
            itemWidth: mediaQueryWidth * 0.5,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        ListOfMovieItems(
          itemHeight: 250,
          movieItem: CustomMovieCard(
            onTap: () {
              Navigator.pushNamed(context, MovieDetailsView.routeName);
            },
            imagePath: ImagePath.tActionImage,
            date: "2024",
            title: "The Beekeeper",
            rating: 6.7,
          ),
        ),
      ],
    );
  }
}
