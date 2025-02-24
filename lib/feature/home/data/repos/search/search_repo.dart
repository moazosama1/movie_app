import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/error.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<MovieItem>>> searchMovie({required String query});
  Future<Either<Failure, List<PreviewItemModel>>> searchMultiItem(
      {required String query});
}
