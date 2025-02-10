import 'package:dartz/dartz.dart';

import 'package:movie_app/core/error/error.dart';
import 'package:movie_app/feature/home/data/model/tv_show_list_model/tv_show_item.dart';

abstract class TvRepo {
  Future<Either<Failure, List<TvShowItemModel>?>> getListTvShowItems(
      {required String categoryId});
  Future<Either<Failure, List<TvShowItemModel>?>> getListTvShowTopRatedItems();
}
