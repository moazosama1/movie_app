part of 'movie_list_cubit.dart';

@immutable
sealed class MovieListState {}

final class MovieListInitial extends MovieListState {}

final class MovieListSuccess extends MovieListState {
  final List<MovieItem>? comingSoonList;
  final List<MovieItem>? topRatedList;
  final List<MovieItem>? topRatedActionList;
  final List<MovieItem>? nowPlayingList;
  final List<MovieItem>? popularList;

  MovieListSuccess({this.comingSoonList, this.topRatedList,
      this.topRatedActionList, this.nowPlayingList, this.popularList});
}

final class MovieListLoading extends MovieListState {}

final class MovieListFailure extends MovieListState {
  final String errorMessage;

  MovieListFailure({required this.errorMessage});
}
