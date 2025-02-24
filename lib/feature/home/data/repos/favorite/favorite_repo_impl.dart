import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/api/api_services.dart';
import 'package:movie_app/core/error/error.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/feature/auth/data/models/auth_model/favorite_request_model.dart';
import 'package:movie_app/feature/auth/data/models/auth_model/favorite_response_model.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/movies_list_model.dart';
import 'package:movie_app/feature/home/data/model/tv_show_list_model/tv_show_item.dart';
import 'package:movie_app/feature/home/data/model/tv_show_list_model/tv_show_list_model.dart';
import 'package:movie_app/feature/home/data/repos/favorite/favorite_repo.dart';

class FavoriteRepoImpl extends FavoriteRepo {
  ApiServices apiServices = ApiServices(dio: Dio());
  // add or delete item to favorite o
  @override
  Future<Either<Failure, FavoriteResponseModel>> favoriteAccount(
      {required int accountId,
      required FavoriteRequestModel? addFavoriteModel}) async {
    try {
      var request = await apiServices.post(
          endPoint: "account/$accountId/favorite",
          data: addFavoriteModel?.toJson());
      var response = FavoriteResponseModel.fromJson(request.data);
      FavoriteResponseModel addFavoriteResponseModel = response;
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieItem>?>> getMovieFavorite({
    required int accountId,
  }) async {
    try {
      var request = await apiServices.get(
          endPoint:
              "account/$accountId/favorite/movies?language=en-US&page=1&sort_by=created_at.asc");
      var response = MoviesListModel.fromJson(request.data);
      List<MovieItem>? movieList = response.results?.toList() ?? [];
      return right(movieList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }

  @override
  Future<Either<Failure, List<TvShowItemModel>?>> getTvShowFavorite({
    required int accountId,
  }) async {
    try {
      var request = await apiServices.get(
          endPoint:
              "account/$accountId/favorite/tv?language=en-US&page=1&sort_by=created_at.asc");
      var response = TvShowListModel.fromJson(request.data);
      List<TvShowItemModel>? tvShowList = response.results?.toList() ?? [];
      return right(tvShowList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }
}
