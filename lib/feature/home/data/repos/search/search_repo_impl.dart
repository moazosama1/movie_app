import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/api/api_services.dart';
import 'package:movie_app/core/error/error.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/movies_list_model.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';
import 'package:movie_app/feature/home/data/repos/search/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  ApiServices apiServices = ApiServices(dio: Dio());
  //function Search Movie
  @override
  Future<Either<Failure, List<MovieItem>>> searchMovie(
      {required String query}) async {
    try {
      var request = await apiServices.get(
          endPoint:
              "search/movie?include_adult=false&language=en-US&page=1&query=$query");
      var response = MoviesListModel.fromJson(request.data);
      List<MovieItem> listTvShow = response.results?.toList() ?? [];
      return right(listTvShow);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }

  @override
  Future<Either<Failure, List<PreviewItemModel>>> searchMultiItem(
      {required String query}) async {
    try {
      var request = await apiServices.get(
          endPoint:
              "search/multi?include_adult=false&language=en-US&page=1&query=$query");
      List<dynamic> results = request.data["results"];
      List<dynamic> filteredResults =
          results.where((item) => item["media_type"] != "person").toList();
      List<PreviewItemModel> listMulti = filteredResults
          .map((json) => PreviewItemModel.fromJson(json))
          .toList();

      return right(listMulti);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }
}
