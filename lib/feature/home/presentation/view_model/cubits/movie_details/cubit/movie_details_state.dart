part of 'movie_details_cubit.dart';

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
