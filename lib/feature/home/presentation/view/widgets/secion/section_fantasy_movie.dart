import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_movie_card.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/list_movie_itmes.dart';

class CustomSectionFantasyMovie extends StatelessWidget {
  const CustomSectionFantasyMovie({super.key});
  @override
  Widget build(BuildContext context) {
    var mediaQuaryHeight = MediaQuery.of(context).size.height;
    var mediaQuaryWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CustomViewMoreMovie(
          title: "Sci-fi & Fantasy",
          onTap: () {},
        ),
        ListOfMovieItems(
          itmeHeight: 250,
          movieItme: CustomMovieCard(
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
