import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/feature/home/presentation/view/movie_details_view.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card.dart';

class MoreMovieBody extends StatelessWidget {
  const MoreMovieBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.2 / 3,
                  crossAxisSpacing: 8),
              itemCount: 30,
              itemBuilder: (context, index) => Center(
                child: CustomMovieCard(
                    onTap: () {
                      Navigator.pushNamed(context, MovieDetailsView.routeName);
                    },
                    date: "2023",
                    title: "The Last Duel",
                    rating: 7.3,
                    imagePath: ImagePath.tActionImage),
              ),
            ),
          )
        ],
      ),
    );
  }
}
