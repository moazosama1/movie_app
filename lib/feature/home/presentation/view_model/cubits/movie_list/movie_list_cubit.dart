import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/data/repos/movie/movie_repo.dart';
import 'package:movie_app/feature/home/data/repos/movie/movie_repo_impel.dart';

part 'movie_list_state.dart';

class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit() : super(MovieListInitial());
  MovieRepo movieRepo = MovieRepoImpel();
  Future<void> getAllMoviesData() async {
    emit(MovieListLoading());

    final topRatedMoviesFuture = movieRepo.getListMoviesTopRated();
    final upComingMoviesFuture = movieRepo.getListMoviesUpcoming();
    final popularMoviesFuture = movieRepo.getListMoviesPopular();
    final nowPlayingMoviesFuture = movieRepo.getListMoviesNowPlaying();
    final actionTopRatedMoviesFuture =
        movieRepo.getListMoviesTopRatedByGenreId(categoryId: "28");

    final results = await Future.wait([
      topRatedMoviesFuture,
      upComingMoviesFuture,
      popularMoviesFuture,
      nowPlayingMoviesFuture,
      actionTopRatedMoviesFuture,
    ]);
    List<MovieItem>? topRatedList = [];
    List<MovieItem>? upcomingList = [];
    List<MovieItem>? popularList = [];
    List<MovieItem>? nowPlayingList = [];
    List<MovieItem>? topRatedActonList = [];
    results[0].fold(
      (l) => emit(MovieListFailure(errorMessage: l.errorMessage)),
      (r) => topRatedList = (r ?? []).cast<MovieItem>(),
    );

    results[1].fold(
      (l) => emit(MovieListFailure(errorMessage: l.errorMessage)),
      (r) => upcomingList = (r ?? []).cast<MovieItem>(),
    );

    results[2].fold(
      (l) => emit(MovieListFailure(errorMessage: l.errorMessage)),
      (r) => popularList = (r ?? []).cast<MovieItem>(),
    );
    results[3].fold(
      (l) => emit(MovieListFailure(errorMessage: l.errorMessage)),
      (r) => nowPlayingList = (r ?? []).cast<MovieItem>(),
    );
    results[4].fold(
      (l) => emit(MovieListFailure(errorMessage: l.errorMessage)),
      (r) => topRatedActonList = (r ?? []).cast<MovieItem>(),
    );

    emit(MovieListSuccess(
        comingSoonList: upcomingList,
        nowPlayingList: nowPlayingList,
        popularList: popularList,
        topRatedActionList: topRatedActonList,
        topRatedList: topRatedList));
  }
}
