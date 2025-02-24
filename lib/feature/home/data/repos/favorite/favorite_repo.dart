import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/error.dart';
import 'package:movie_app/feature/auth/data/models/auth_model/favorite_request_model.dart';
import 'package:movie_app/feature/auth/data/models/auth_model/favorite_response_model.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/data/model/tv_show_list_model/tv_show_item.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, FavoriteResponseModel>> favoriteAccount(
      {required int accountId,
      required FavoriteRequestModel? addFavoriteModel});
  Future<Either<Failure, List<MovieItem>?>> getMovieFavorite({
    required int accountId,
  });
  Future<Either<Failure, List<TvShowItemModel>?>> getTvShowFavorite(
      {required int accountId});
}
