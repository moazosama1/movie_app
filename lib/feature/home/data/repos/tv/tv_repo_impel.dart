import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/api/api_services.dart';
import 'package:movie_app/core/api/api_url.dart';
import 'package:movie_app/core/error/error.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/feature/home/data/model/tv_show_list_model/tv_show_item.dart';
import 'package:movie_app/feature/home/data/model/tv_show_list_model/tv_show_list_model.dart';
import 'package:movie_app/feature/home/data/repos/tv/tv_repo.dart';

class TvRepoImpel extends TvRepo {
  ApiServices apiServices = ApiServices(dio: Dio());
  @override
  Future<Either<Failure, List<TvShowItemModel>?>> getListTvShowItems(
      {required String categoryId}) async {
    try {
      var request = await apiServices.get(
          endPoint: "${ApiUrl.listTvShowByGenresIdUrl}$categoryId");
      var response = TvShowListModel.fromJson(request.data);
      List<TvShowItemModel> listTvShow = response.results?.toList() ?? [];
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
  Future<Either<Failure, List<TvShowItemModel>?>>
      getListTvShowTopRatedItems() async {
    try {
      var request = await apiServices.get(
          endPoint: ApiUrl.genresTvShowTopRatedEndPointUrl);
      var response = TvShowListModel.fromJson(request.data);
      List<TvShowItemModel> listTvShow = response.results?.toList() ?? [];
      return right(listTvShow);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }
}
