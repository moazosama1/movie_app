import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/error.dart';
import 'package:movie_app/feature/home/data/model/genres_list_model/genre.dart';
import 'package:movie_app/feature/home/data/model/movie_details_model/movie_details_model/movie_details_model.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';

abstract class MovieRepo {
  Future<Either<Failure, List<MovieItem>?>> getListMoviesItems(
      {required String categoryId});

  Future<Either<Failure, List<MovieItem>?>> getListMoviesUpcoming();
  Future<Either<Failure, List<MovieItem>?>> getListMoviesTopRated();
  Future<Either<Failure, List<MovieItem>?>> getListMoviesTopRatedByGenreId(
      {required String categoryId});
  Future<Either<Failure, List<MovieItem>?>> getListMoviesTrendingByGenreId(
      {required String categoryId});
  Future<Either<Failure, List<MovieItem>?>> getListMoviesLastReleaseByGenreId(
      {required String categoryId});
  Future<Either<Failure, List<MovieItem>?>> getSimilarMoviesItems(
      {required int movieId});
  Future<Either<Failure, MovieDetailsModel>> getMoviesDetailsById(
      {required int movieId});
  Future<Either<Failure, List<GenreItem>?>> getGenresList();
}
