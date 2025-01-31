import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/core/widgets/custom_text_filed.dart';
import 'package:movie_app/feature/home/presentation/view/movie_details_view.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_movie_card.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Find Movies, Tv series,\nand more..",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFiledSearch(),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                ),
                scrollDirection: Axis.vertical,
                itemCount: 30,
                itemBuilder: (context, index) => Center(
                      child: CustomMovieCard(
                          onTap: () {
                            Navigator.pushNamed(
                                context, MovieDetailsView.routeName);
                          },
                          date: "2023",
                          title: "The Last Duel",
                          rating: 7.3,
                          imagePath: ImagePath.tActionImage),
                    )),
          )
        ],
      ),
    );
  }
}
