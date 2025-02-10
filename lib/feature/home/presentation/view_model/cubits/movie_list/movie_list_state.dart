part of 'movie_list_cubit.dart';

@immutable
sealed class MovieListState {}

final class MovieListInitial extends MovieListState {}

final class MovieListSuccess extends MovieListState {
  final List<MovieItem>? actionListMovies;
  final List<MovieItem>? topRatedActionListMovies;
  final List<MovieItem>? comediesListMovies;
  final List<MovieItem>? comediesTopRatedListMovies;
  final List<MovieItem>? topRatedMovies;
  final List<MovieItem>? familyMovies;
  final List<MovieItem>? childrenListMovies;
  final List<TvShowItemModel>? seriesTvShowList;
  final List<MovieItem>? fantasyListMovies;
  final List<MovieItem>? upcomingListMovies;

  MovieListSuccess(
      {this.actionListMovies,
      this.comediesTopRatedListMovies,
      this.topRatedActionListMovies,
      this.comediesListMovies,
      this.topRatedMovies,
      this.familyMovies,
      this.childrenListMovies,
      this.seriesTvShowList,
      this.fantasyListMovies,
      this.upcomingListMovies});
}

final class MovieListLoading extends MovieListState {}

final class MovieListFailure extends MovieListState {
  final String errorMessage;

  MovieListFailure({required this.errorMessage});
}
