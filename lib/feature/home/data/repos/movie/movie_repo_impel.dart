import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/api/api_services.dart';
import 'package:movie_app/core/api/api_url.dart';
import 'package:movie_app/core/error/error.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/feature/home/data/model/genres_list_model/genre.dart';
import 'package:movie_app/feature/home/data/model/genres_list_model/genres_list_model.dart';
import 'package:movie_app/feature/home/data/model/movie_details_model/movie_details_model.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/movies_list_model.dart';
import 'package:movie_app/feature/home/data/repos/movie/movie_repo.dart';

class MovieRepoImpel extends MovieRepo {
  // common error is the common message
  // ApiUrl it is the class includes the all Url in the app
  ApiServices apiServices = ApiServices(dio: Dio());
  //get list of movie by genres id
  @override
  Future<Either<Failure, List<MovieItem>?>> getListMoviesItems(
      {required String categoryId}) async {
    try {
      var request = await apiServices.get(
          endPoint: "${ApiUrl.listMoviesByGenresIdUrl}$categoryId");
      var response = MoviesListModel.fromJson(request.data);
      List<MovieItem> listMovies = response.results?.toList() ?? [];
      return right(listMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }

  //get list of movie by genres id top rated
  @override
  Future<Either<Failure, List<MovieItem>?>> getListMoviesTopRatedByGenreId(
      {required String categoryId}) async {
    try {
      var request = await apiServices.get(
          endPoint:
              "discover/movie?with_genres=$categoryId&include_adult=false&include_video=false&language=en-US&page=1&sort_by=vote_average.desc&without_genres=99,10755&vote_count.gte=200");
      var response = MoviesListModel.fromJson(request.data);
      List<MovieItem> listMovies = response.results?.toList() ?? [];
      return right(listMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }

//get movie details by movie id
  @override
  Future<Either<Failure, MovieDetailsModel>> getMoviesDetailsById(
      {required int movieId}) async {
    try {
      var request =
          await apiServices.get(endPoint: "movie/$movieId?language=en-US");
      var response = MovieDetailsModel.fromJson(request.data);
      MovieDetailsModel movieDetails = response;
      return right(movieDetails);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }

//get similar movie by movie id
  @override
  Future<Either<Failure, List<MovieItem>?>> getSimilarMoviesItems(
      {required int movieId}) async {
    try {
      var request = await apiServices.get(
          endPoint: "movie/$movieId/similar?language=en-US&page=1");
      var response = MoviesListModel.fromJson(request.data);
      List<MovieItem> listMovies = response.results?.toList() ?? [];
      return right(listMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }

//get genres list movie list || tv list
  @override
  Future<Either<Failure, List<Genre>?>> getGenresList() async {
    try {
      var request =
          await apiServices.get(endPoint: ApiUrl.genresMovieListEndPointUrl);
      var response = GenresListModel.fromJson(request.data);
      List<Genre> listGenres = response.genres?.toList() ?? [];
      return right(listGenres);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }

//get upcoming soon movies
  @override
  Future<Either<Failure, List<MovieItem>?>> getListMoviesUpcoming() async {
    try {
      var request = await apiServices.get(endPoint: ApiUrl.upcomingEndPointUrl);
      var response = MoviesListModel.fromJson(request.data);
      List<MovieItem>? listMovies = response.results?.toList() ?? [];
      return right(listMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }

//get list movies top rated without genre id
  @override
  Future<Either<Failure, List<MovieItem>?>> getListMoviesTopRated() async {
    try {
      var request =
          await apiServices.get(endPoint: ApiUrl.tpRatedMovieEndPointUrl);
      var response = MoviesListModel.fromJson(request.data);
      List<MovieItem> listMovies = response.results?.toList() ?? [];
      return right(listMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieItem>?>> getListMoviesLastReleaseByGenreId(
      {required String categoryId}) async {
    try {
      var request = await apiServices.get(
          endPoint:
              "discover/movie?page=1&sort_by=release_date.desc&with_genres=$categoryId&primary_release_date.lte=${DateTime.now().toIso8601String().split("T")[0]}");
      var response = MoviesListModel.fromJson(request.data);
      List<MovieItem> listMovies = response.results?.toList() ?? [];
      return right(listMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieItem>?>> getListMoviesTrendingByGenreId(
      {required String categoryId}) async {
    try {
      var request = await apiServices.get(
          endPoint: "${ApiUrl.trendingByGenresUrl}$categoryId");
      var response = MoviesListModel.fromJson(request.data);
      List<MovieItem> listMovies = response.results?.toList() ?? [];
      return right(listMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieItem>?>> getListMoviesNowPlaying() async {
    try {
      var request =
          await apiServices.get(endPoint: ApiUrl.nowPlayingEndPointUrl);
      var response = MoviesListModel.fromJson(request.data);
      List<MovieItem>? listMovies = response.results?.toList() ?? [];
      return right(listMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieItem>?>> getListMoviesPopular() async {
    try {
      var request =
          await apiServices.get(endPoint: ApiUrl.popularMovieEndPointUrl);
      var response = MoviesListModel.fromJson(request.data);
      List<MovieItem>? listMovies = response.results?.toList() ?? [];
      return right(listMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieItem>?>> getRecommendationsMoviesItems(
      {required int movieId}) async {
    try {
      var request = await apiServices.get(
          endPoint: "movie/$movieId/recommendations?language=en-US&page=1");
      var response = MoviesListModel.fromJson(request.data);
      List<MovieItem> listMovies = response.results?.toList() ?? [];
      return right(listMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }
}
