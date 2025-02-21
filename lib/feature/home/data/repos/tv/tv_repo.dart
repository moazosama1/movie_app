import 'package:dartz/dartz.dart';

import 'package:movie_app/core/error/error.dart';
import 'package:movie_app/feature/home/data/model/tv_show_details_model/tv_show_details_model.dart';
import 'package:movie_app/feature/home/data/model/tv_show_list_model/tv_show_item.dart';

abstract class TvRepo {
  Future<Either<Failure, List<TvShowItemModel>?>> getListTvShowItems(
      {required String categoryId});
  Future<Either<Failure, List<TvShowItemModel>?>> getSimilarListTvShowItems(
      {required int id});
  Future<Either<Failure, List<TvShowItemModel>?>>
      getRecommendationsListTvShowItems({required int id});
  Future<Either<Failure, TvShowDetailsModel>> getTvShowDetailsItems(
      {required int id});
  Future<Either<Failure, List<TvShowItemModel>?>> getListTvShowTopRatedItems();
  Future<Either<Failure, List<TvShowItemModel>?>> getListTvShowTrendingItems();
  Future<Either<Failure, List<TvShowItemModel>?>>
      getListTvShowAiringTodayItems();
}
