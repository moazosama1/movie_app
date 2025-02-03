import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/feature/home/presentation/view/movie_details_view.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/banner_widget/custom_image_banner_bg.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card_large.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/list_movie_items.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_children.dart';

class CustomCategoryScreenItem extends StatelessWidget {
  const CustomCategoryScreenItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CustomBannerImageBg(imagePath: ImagePath.tCover2Image),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              CustomSectionTwoItemsMovie(
                title: "Trending",
              ),
              SizedBox(
                height: 8,
              ),
              CustomViewMoreMovie(title: "Latest Releases"),
              SizedBox(
                height: 8,
              ),
              ListOfMovieItems(
                itemHeight: mediaQueryHeight * 0.17,
                movieItem: CustomMovieCardLarge(
                    onTap: () {
                      Navigator.pushNamed(context, MovieDetailsView.routeName);
                    },
                    title: "The Last Duel",
                    date: 2021,
                    rating: 7.1,
                    itemWidth: mediaQueryWidth * .7,
                    itemHeight: 0.16,
                    imagePath: ImagePath.tCoverItemLImage),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
