import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/feature/home/presentation/view/movie_details_view.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_movie_card.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/list_movie_items.dart';

class CustomSectionTwoItemsMovie extends StatelessWidget {
  const CustomSectionTwoItemsMovie({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomViewMoreMovie(
          title: title,
          onTap: () {},
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
            imagePath: ImagePath.tCover2Image,
            date: "2024",
            title: "The Beekeeper",
            rating: 6.7,
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
            imagePath: ImagePath.tChildrenImage,
            date: "2024",
            title: "The Beekeeper",
            rating: 6.7,
          ),
        ),
      ],
    );
  }
}
