
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_movie_card.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/list_movie_itmes.dart';

class CustomSectionChildrenMovie extends StatelessWidget {
  const CustomSectionChildrenMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomViewMoreMovie(
          title: "Children & Family",
          onTap: () {},
        ),
        SizedBox(
          height: 8,
        ),
        ListOfMovieItems(
          itmeHeight: 250,
          movieItme: CustomMovieCard(
            imagePath: ImagePath.tchildrenImage,
            date: "2024",
            title: "The Beekeeper",
            rating: 6.7,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        ListOfMovieItems(
          itmeHeight: 250,
          movieItme: CustomMovieCard(
            imagePath: ImagePath.tchildrenImage,
            date: "2024",
            title: "The Beekeeper",
            rating: 6.7,
          ),
        ),
      ],
    );
  }
}
