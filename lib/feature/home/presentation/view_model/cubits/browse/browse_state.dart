part of 'browse_cubit.dart';

@immutable
sealed class BrowseState {}

final class BrowseInitial extends BrowseState {}

// ignore: must_be_immutable
final class BrowseSuccess extends BrowseState {
  List<MovieItem>? lastReleaseList;
  List<MovieItem>? listMovies;
  List<MovieItem>? trendingMoviesList;
  BrowseSuccess(
      {this.lastReleaseList, this.listMovies, this.trendingMoviesList});
}

final class BrowseLoading extends BrowseState {}

final class BrowseFailure extends BrowseState {
  final String errorMessage;

  BrowseFailure({required this.errorMessage});
}
