

import 'package:meta/meta.dart';
import 'package:movie_app/feature/home/data/model/movie_details_model/movie_details_model.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetailsModel? movieDetailsModel;
  final List<MovieItem>? movieSimilar;
  MovieDetailsSuccess({
    this.movieDetailsModel,
    this.movieSimilar,
  });
}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsFailure extends MovieDetailsState {
  final String errorMessage;

  MovieDetailsFailure({required this.errorMessage});
}
