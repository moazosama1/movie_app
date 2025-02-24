import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/screen_body/movie_details_body.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/screen_body/tv_show_details_body.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/movie_details/movie_details_cubit.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/tv_details/tv_show_details_cubit.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});
  static const String routeName = kMovieView;
  @override
  Widget build(BuildContext context) {
    final previewItem =
        ModalRoute.of(context)!.settings.arguments as PreviewItemModel;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          previewItem.title ?? previewItem.originalName ?? "",
          style: theme.textTheme.titleMedium,
        ),
      ),
      body: previewItem.releaseDate != null
          ? BlocProvider(
              create: (context) {
                final cubit = MovieDetailsCubit();
                cubit.gitMovieDetailsAllInfo(movieId: previewItem.id ?? 0);
                return cubit;
              },
              child: MovieDetailsBody(),
            )
          : BlocProvider(
              create: (context) {
                final cubit = TvShowDetailsCubit();
                cubit.gitTvShowDetailsAllInfo(tvId: previewItem.id ?? 0);
                return cubit;
              },
              child: TvShowDetailsBody(),
            ),
    );
  }
}
