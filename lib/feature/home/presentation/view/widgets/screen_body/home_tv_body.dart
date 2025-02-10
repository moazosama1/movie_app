import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/feature/home/presentation/view/movie_details_view.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/section/section_banner_widget.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/tv_list/tv_list_cubit.dart';

class HomeTvBody extends StatelessWidget {
  const HomeTvBody({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Column(
      children: [
        BlocBuilder<TvListCubit, TvListState>(
          builder: (context, state) {
            switch (state) {
              case TvListInitial():
                // TODO: Handle this case.
                throw UnimplementedError();

              case TvListSuccess():
                return CustomBannerWidget(
                  isMovie: false,
                  tvListItems: state.topRatedTv,
                );
              case TvListLoading():
                return SizedBox(
                  height: mediaQueryHeight * .4,
                  child: Center(child: CircularProgressIndicator()),
                );

              case TvListFailure():
                return SizedBox(
                  height: mediaQueryHeight * .4,
                  child: Center(
                      child: Text(
                    state.errorMessage,
                    style: theme.textTheme.labelLarge,
                  )),
                );
            }
          },
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomViewMoreMovie(title: "Popular", movieList: []),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 250,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CustomMovieCard(
                        onTap: () {
                          Navigator.pushNamed(
                              context, MovieDetailsView.routeName);
                        },
                        date: "2023",
                        title: "The Last Duel",
                        rating: 7.3,
                        imagePath: ImagePath.tActionImage),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 8,
                        ),
                    itemCount: 20),
              )
            ],
          ),
        )
      ],
    );
  }
}
