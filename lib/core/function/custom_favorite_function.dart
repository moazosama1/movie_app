import 'package:movie_app/feature/auth/data/models/auth_model/favorite_request_model.dart';

class CustomFavoriteFunction {
  static addMovieItem({required int movieId}) {
    FavoriteRequestModel? favoriteRequestModel = FavoriteRequestModel(
        favorite: true, mediaId: movieId, mediaType: "movie");
    return favoriteRequestModel;
  }

  static addTvShoeItem({required int tvId}) {
    FavoriteRequestModel? favoriteRequestModel = FavoriteRequestModel(
        favorite: true, mediaId: tvId, mediaType: "tv");
    return favoriteRequestModel;
  }
  static deleteMovieItem({required int movieId}) {
    FavoriteRequestModel? favoriteRequestModel = FavoriteRequestModel(
        favorite: false, mediaId: movieId, mediaType: "movie");
    return favoriteRequestModel;
  }

  static deleteTvShoeItem({required int tvId}) {
    FavoriteRequestModel? favoriteRequestModel = FavoriteRequestModel(
        favorite: false, mediaId: tvId, mediaType: "tv");
    return favoriteRequestModel;
  }
}
