part of 'for_you_list_cubit.dart';

@immutable
sealed class ForYouListState {}

final class ForYouListInitial extends ForYouListState {}

final class ForYouListSuccess extends ForYouListState {
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

  ForYouListSuccess(
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

final class ForYouListLoading extends ForYouListState {}

final class ForYouListFailure extends ForYouListState {
  final String errorMessage;

  ForYouListFailure({required this.errorMessage});
}
