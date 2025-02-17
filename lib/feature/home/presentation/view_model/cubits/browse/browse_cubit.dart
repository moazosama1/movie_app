import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/feature/home/data/model/genres_list_model/genre.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/data/repos/movie/movie_repo.dart';
import 'package:movie_app/feature/home/data/repos/movie/movie_repo_impel.dart';

part 'browse_state.dart';

class BrowseCubit extends Cubit<BrowseState> {
  BrowseCubit() : super(BrowseInitial());
  MovieRepo homeRepo = MovieRepoImpel();
  List<Genre>? genresMovie = [];
  List<MovieItem>? listMovie = [];
  getGenresList() async {
    emit(BrowseLoading());
    var data = await homeRepo.getGenresList();
    data.fold((l) => emit(BrowseFailure(errorMessage: l.errorMessage)),
        (right) {
      genresMovie = right;
      emit(BrowseSuccess());
    });
  }

  getLastReleaseMovieListByGenreId({required String categoryId}) async {
    emit(BrowseLoading());
    var data = await homeRepo.getListMoviesLastReleaseByGenreId(
        categoryId: categoryId);
    data.fold(
      (l) => emit(BrowseFailure(errorMessage: l.errorMessage)),
      (right) {
        listMovie = right;
        emit(BrowseSuccess(lastReleaseList: right));
      },
    );
  }

  getTopRatedMovieListByGenreId({required String categoryId}) async {
    emit(BrowseLoading());
    var data =
        await homeRepo.getListMoviesTopRatedByGenreId(categoryId: categoryId);
    data.fold(
      (l) => emit(BrowseFailure(errorMessage: l.errorMessage)),
      (right) {
        emit(BrowseSuccess(listMovies: right ?? []));
      },
    );
  }

  Future<void> getAllData() async {
    final getGenres = homeRepo.getGenresList();
    final lastReleaseMoviesFuture =
        homeRepo.getListMoviesLastReleaseByGenreId(categoryId: "28");
    final listMoviesFuture = homeRepo.getListMoviesItems(categoryId: "28");
    final trendingListMoviesFuture =
        homeRepo.getListMoviesTrendingByGenreId(categoryId: "28");
    final results = await Future.wait([
      getGenres,
      lastReleaseMoviesFuture,
      listMoviesFuture,
      trendingListMoviesFuture
    ]);
    List<Genre>? genresList = [];
    List<MovieItem>? lastReleaseList = [];
    List<MovieItem>? listMovies = [];
    List<MovieItem>? trendingMoviesList = [];
    results[0].fold(
      (l) => emit(BrowseFailure(errorMessage: l.errorMessage)),
      (r) => genresMovie = (r ?? []).cast<Genre>(),
    );
    results[1].fold(
      (l) => emit(BrowseFailure(errorMessage: l.errorMessage)),
      (r) => lastReleaseList = (r ?? []).cast<MovieItem>(),
    );
    results[2].fold(
      (l) => emit(BrowseFailure(errorMessage: l.errorMessage)),
      (r) => listMovies = (r ?? []).cast<MovieItem>(),
    );
    results[3].fold(
      (l) => emit(BrowseFailure(errorMessage: l.errorMessage)),
      (r) => trendingMoviesList = (r ?? []).cast<MovieItem>(),
    );
    emit(BrowseSuccess(
        lastReleaseList: lastReleaseList,
        listMovies: listMovies,
        trendingMoviesList: trendingMoviesList));
  }

  Future<void> getAllDataInGenresId({required String categoryId}) async {
    final lastReleaseMoviesFuture =
        homeRepo.getListMoviesLastReleaseByGenreId(categoryId: categoryId);
    final listMoviesFuture =
        homeRepo.getListMoviesItems(categoryId: categoryId);
    final trendingListMoviesFuture =
        homeRepo.getListMoviesTrendingByGenreId(categoryId: categoryId);
    final results = await Future.wait([
      lastReleaseMoviesFuture,
      listMoviesFuture,
      trendingListMoviesFuture,
    ]);

    List<MovieItem>? lastReleaseList = [];
    List<MovieItem>? listMovies = [];
    List<MovieItem>? trendingMoviesList = [];
    results[0].fold(
      (l) => emit(BrowseFailure(errorMessage: l.errorMessage)),
      (r) => lastReleaseList = (r ?? []).cast<MovieItem>(),
    );
    results[1].fold(
      (l) => emit(BrowseFailure(errorMessage: l.errorMessage)),
      (r) => listMovies = (r ?? []).cast<MovieItem>(),
    );
    results[2].fold(
      (l) => emit(BrowseFailure(errorMessage: l.errorMessage)),
      (r) => trendingMoviesList = (r ?? []).cast<MovieItem>(),
    );
    emit(BrowseSuccess(
        lastReleaseList: lastReleaseList,
        listMovies: listMovies,
        trendingMoviesList: trendingMoviesList));
  }
}
