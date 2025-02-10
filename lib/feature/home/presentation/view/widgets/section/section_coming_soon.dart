import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/presentation/view/movie_details_view.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_card_image_widget.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_view_more_movie.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/movie_list/movie_list_cubit.dart';

class CustomSectionComingSoonMovie extends StatelessWidget {
  const CustomSectionComingSoonMovie({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = BlocProvider.of<MovieListCubit>(context);
    return BlocBuilder<MovieListCubit, MovieListState>(
      builder: (context, state) {
        switch (state) {
          case MovieListInitial():
            // TODO: Handle this case.
            throw UnimplementedError();
          case MovieListSuccess():
            return Column(
              children: [
                CustomViewMoreMovie(
                  title: "Coming Soon",
                  movieList: state.upcomingListMovies,
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 230,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: 8,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            MovieDetailsView.routeName,
                            arguments: state.upcomingListMovies?[index]);
                      },
                      child: CustomImageCardWidget(
                        imagePath: state.upcomingListMovies?[index].posterPath,
                      ),
                    ),
                    itemCount: state.upcomingListMovies?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            );

          case MovieListLoading():
            return SizedBox(
                height: 230, child: Center(child: CircularProgressIndicator()));
          case MovieListFailure():
            return Center(
                child: Text(
              state.errorMessage,
              style: theme.textTheme.titleMedium,
            ));
        }
      },
    );
  }
}
