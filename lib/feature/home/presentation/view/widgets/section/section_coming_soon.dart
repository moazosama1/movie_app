import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/presentation/view/more_movie_view.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/list_coming_soon.dart';
class CustomSectionComingSoonMovie extends StatelessWidget {
  const CustomSectionComingSoonMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomViewMoreMovie(
          title: "Coming Soon",
          onTap: () {
            Navigator.pushNamed(context, MoreMovieView.routeName,
                arguments: "Coming Soon");
          },
        ),
        SizedBox(
          height: 8,
        ),
        CustomListComingSoon(),
      ],
    );
  }
}
