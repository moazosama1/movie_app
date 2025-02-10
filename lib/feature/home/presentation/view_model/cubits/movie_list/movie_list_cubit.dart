import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/data/model/tv_show_list_model/tv_show_item.dart';
import 'package:movie_app/feature/home/data/repos/movie/movie_repo.dart';
import 'package:movie_app/feature/home/data/repos/movie/movie_repo_impel.dart';
import 'package:movie_app/feature/home/data/repos/tv/tv_repo.dart';
import 'package:movie_app/feature/home/data/repos/tv/tv_repo_impel.dart';

part 'movie_list_state.dart';

class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit() : super(MovieListInitial());
  MovieRepo movieRepo = MovieRepoImpel();
  TvRepo tvRepo = TvRepoImpel();
  getMovieList({required String categoryId}) async {
    emit(MovieListLoading());
    var data = await movieRepo.getListMoviesItems(categoryId: categoryId);
    data.fold(
      (l) => emit(MovieListFailure(errorMessage: l.errorMessage)),
      (right) {
        emit(MovieListSuccess(actionListMovies: right ?? []));
      },
    );
  }

  getMovieFantasyList({required String categoryId}) async {
    emit(MovieListLoading());
    var data = await movieRepo.getListMoviesItems(categoryId: categoryId);
    data.fold(
      (l) => emit(MovieListFailure(errorMessage: l.errorMessage)),
      (right) {
        emit(MovieListSuccess(fantasyListMovies: right ?? []));
      },
    );
  }

  getTopRatedMovieListByGenreId({required String categoryId}) async {
    emit(MovieListLoading());
    var data =
        await movieRepo.getListMoviesTopRatedByGenreId(categoryId: categoryId);
    data.fold(
      (l) => emit(MovieListFailure(errorMessage: l.errorMessage)),
      (right) {
        emit(MovieListSuccess(topRatedMovies: right ?? []));
      },
    );
  }

  getTopRatedMovieList() async {
    emit(MovieListLoading());
    var data = await movieRepo.getListMoviesTopRated();
    data.fold(
      (l) => emit(MovieListFailure(errorMessage: l.errorMessage)),
      (right) {
        emit(MovieListSuccess(topRatedMovies: right ?? []));
      },
    );
  }

  getUpComingList() async {
    emit(MovieListLoading());
    var data = await movieRepo.getListMoviesUpcoming();
    data.fold(
      (l) => emit(MovieListFailure(errorMessage: l.errorMessage)),
      (right) {
        // emit(MovieListSuccess(upcomingListMovies: right ?? []));
      },
    );
  }

  Future<void> getAllMoviesData() async {
    emit(MovieListLoading());

    final fantasyMoviesFuture = movieRepo.getListMoviesItems(categoryId: "878");
    final actionMoviesFuture = movieRepo.getListMoviesItems(categoryId: "28");
    final topRatedMoviesFuture =
        movieRepo.getListMoviesTopRatedByGenreId(categoryId: "28");
    final upcomingMoviesFuture = movieRepo.getListMoviesUpcoming();
    final comediesTopRatedMoviesFuture =
        movieRepo.getListMoviesTopRatedByGenreId(categoryId: "35");
    final comediesMoviesFuture = movieRepo.getListMoviesItems(categoryId: "35");
    final seriesTvShowFuture = tvRepo.getListTvShowItems(categoryId: "10759");
    final familyTopRatedMoviesFuture =
        movieRepo.getListMoviesTopRatedByGenreId(categoryId: "10751");
    final childrenMoviesFuture = movieRepo.getListMoviesItems(categoryId: "16");

    final results = await Future.wait([
      fantasyMoviesFuture,
      topRatedMoviesFuture,
      upcomingMoviesFuture,
      comediesTopRatedMoviesFuture,
      comediesMoviesFuture,
      seriesTvShowFuture,
      familyTopRatedMoviesFuture,
      childrenMoviesFuture,
      actionMoviesFuture
    ]);
    List<MovieItem>? actionList;
    List<MovieItem>? fantasyList = [];
    List<MovieItem>? topRatedList = [];
    List<MovieItem>? upcomingList = [];
    List<MovieItem>? comediesList = [];
    List<MovieItem>? comediesTopRatedList = [];
    List<TvShowItemModel>? seriesTvShowList = [];
    List<MovieItem>? familyTopRatedList = [];
    List<MovieItem>? childrenList = [];
    results[0].fold(
      (l) => emit(MovieListFailure(errorMessage: l.errorMessage)),
      (r) => fantasyList = (r ?? []).cast<MovieItem>(),
    );

    results[1].fold(
      (l) => emit(MovieListFailure(errorMessage: l.errorMessage)),
      (r) => topRatedList = (r ?? []).cast<MovieItem>(),
    );

    results[2].fold(
      (l) => emit(MovieListFailure(errorMessage: l.errorMessage)),
      (r) => upcomingList = (r ?? []).cast<MovieItem>(),
    );
    results[3].fold(
      (l) => emit(MovieListFailure(errorMessage: l.errorMessage)),
      (r) => comediesTopRatedList = (r ?? []).cast<MovieItem>(),
    );
    results[4].fold(
      (l) => emit(MovieListFailure(errorMessage: l.errorMessage)),
      (r) => comediesList = (r ?? []).cast<MovieItem>(),
    );
    results[5].fold(
      (l) => emit(MovieListFailure(errorMessage: l.errorMessage)),
      (r) => seriesTvShowList = (r ?? []).cast<TvShowItemModel>(),
    );
    results[6].fold(
      (l) => emit(MovieListFailure(errorMessage: l.errorMessage)),
      (r) => familyTopRatedList = (r ?? []).cast<MovieItem>(),
    );
    results[7].fold(
      (l) => emit(MovieListFailure(errorMessage: l.errorMessage)),
      (r) => childrenList = (r ?? []).cast<MovieItem>(),
    );
    results[8].fold(
      (l) => emit(MovieListFailure(errorMessage: l.errorMessage)),
      (r) => actionList = (r ?? []).cast<MovieItem>(),
    );

    emit(MovieListSuccess(
        fantasyListMovies: fantasyList,
        topRatedMovies: topRatedList,
        upcomingListMovies: upcomingList,
        comediesListMovies: comediesList,
        comediesTopRatedListMovies: comediesTopRatedList,
        seriesTvShowList: seriesTvShowList,
        familyMovies: familyTopRatedList,
        childrenListMovies: childrenList,
        actionListMovies: actionList));
  }
}
