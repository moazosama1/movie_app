import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/error/error.dart';
import 'package:movie_app/feature/home/data/model/movie_details_model/movie_details_model/movie_details_model.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/data/repos/movie/movie_repo.dart';
import 'package:movie_app/feature/home/data/repos/movie/movie_repo_impel.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());
  final MovieRepo homeRepo = MovieRepoImpel();
  // getMovieDetailsByMovieId({required int movieId}) async {
  //   emit(MovieDetailsLoading());
  //   var data = await homeRepo.getMoviesDetailsById(movieId: movieId);
  //   data.fold(
  //     (left) => emit(MovieDetailsFailure(errorMessage: left.errorMessage)),
  //     (right) {
  //       // movieDetailsModel = right;
  //       emit(MovieDetailsSuccess(movieDetailsModel: right));
  //     },
  //   );
  // }

  // getSimilarMovieByMovieId({required int movieId}) async {
  //   emit(MovieDetailsLoading());
  //   var data = await homeRepo.getSimilarMoviesItems(movieId: movieId);
  //   data.fold(
  //       (left) => emit(MovieDetailsFailure(errorMessage: left.errorMessage)),
  //       (right) {
  //     // similarList = right;
  //     // emit(MovieDetailsSuccess(similarList: right));
  //   });
  // }

  Future<void> gitMovieDetailsAllInfo({required int movieId}) async {
    emit(MovieDetailsLoading());

    final movieDetailsFuture = homeRepo.getMoviesDetailsById(movieId: movieId);
    final similarMovieFuture = homeRepo.getSimilarMoviesItems(movieId: movieId);

    final results = await Future.wait([movieDetailsFuture, similarMovieFuture]);

    final movieDetailsEither =
        results[0] as Either<Failure, MovieDetailsModel?>;
    final similarMoviesEither = results[1] as Either<Failure, List<MovieItem>?>;

    // Extracting data correctly using fold
    MovieDetailsModel? itemMovieDetails;
    List<MovieItem>? similarList;

    movieDetailsEither.fold(
      (l) {
        emit(MovieDetailsFailure(errorMessage: l.errorMessage));
        return;
      },
      (r) => itemMovieDetails = r,
    );

    similarMoviesEither.fold(
      (l) {
        emit(MovieDetailsFailure(errorMessage: l.errorMessage));
        return;
      },
      (r) => similarList = r,
    );

    if (itemMovieDetails != null && similarList != null) {
      emit(MovieDetailsSuccess(
        movieDetailsModel: itemMovieDetails!,
        movieSimilar: similarList!,
      ));
    }
  }

  @override
  void onChange(Change<MovieDetailsState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
