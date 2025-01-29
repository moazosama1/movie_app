import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_banner_bg.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_movie_card.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_movie_card_large.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_tab_bar.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/list_coming_soon.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/list_movie_itmes.dart';

import '../../../../../../core/widgets/list_tab_bar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuaryHeight = MediaQuery.of(context).size.height;
    var mediaQuaryWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: tab.length,
      child: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: mediaQuaryHeight * .45,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                opacity: 0.5,
                image: AssetImage(ImagePath.tCoverImage),
              )),
              child: Column(
                children: [
                  CustomTabBar(
                    onTap: (p0) {},
                  ),
                  Spacer(),
                  CustomBannerBg()
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  CustomViewMoreMovie(
                    title: "Coming Soon",
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomListComingSoon(),
                  SizedBox(
                    height: 8,
                  ),
                  CustomViewMoreMovie(
                    title: "Action & Adventure",
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ListOfMovieItems(
                    itmeHeight: mediaQuaryHeight * 0.2,
                    movieItme: CustomMovieCardLarge(
                      imagePath: ImagePath.tCoverItemLImage,
                      title: "Freelance",
                      date: 2024,
                      rating: 4.7,
                      itemHeight: mediaQuaryHeight * 0.2,
                      itmeWidth: mediaQuaryWidth * 0.9,
                    ),
                  ),
                  SizedBox(
                    height: 8,
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
                  CustomViewMoreMovie(
                    title: "Comedies",
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ListOfMovieItems(
                    itmeHeight: mediaQuaryHeight * 0.15,
                    movieItme: CustomMovieCardLarge(
                      imagePath: ImagePath.tCoverItemSImage,
                      title: "Mean Girls",
                      date: 2024,
                      rating: 5.9,
                      itemHeight: mediaQuaryHeight * 0.17,
                      itmeWidth: mediaQuaryWidth * 0.5,
                    ),
                  ),
                  SizedBox(
                    height: 8,
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
                  SizedBox(
                    height: 16,
                  ),
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
                  SizedBox(
                    height: 8,
                  ),
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
              ),
            )
          ],
        ),
      )),
    );
  }
}
