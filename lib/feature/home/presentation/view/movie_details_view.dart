import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/screen_body/movie_details_body.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/movie_details/cubit/movie_details_cubit.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});
  static const String routeName = kMovieView;
  @override
  Widget build(BuildContext context) {
    final movieItem = ModalRoute.of(context)!.settings.arguments as MovieItem?;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movieItem?.originalTitle ?? "",
          style: theme.textTheme.titleMedium,
        ),
      ),
      body: BlocProvider(
        create: (context) {
          final cubit = MovieDetailsCubit();
          cubit.gitMovieDetailsAllInfo(movieId: movieItem?.id ?? 0);
          return cubit;
        },
        child: MovieDetailsBody(),
      ),
    );
  }
}
