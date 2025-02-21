import 'package:movie_app/feature/home/data/model/movie_details_model/movie_details_model.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_details.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';
import 'package:movie_app/feature/home/data/model/tv_show_details_model/season.dart';
import 'package:movie_app/feature/home/data/model/tv_show_details_model/tv_show_details_model.dart';
import 'package:movie_app/feature/home/data/model/tv_show_list_model/tv_show_item.dart';

class CustomFunction {
  static String? gitReleaseDate({required String? releaseDate}) {
    if (releaseDate != null) {
      if (releaseDate.length >= 4) {
        String processReleaseDate = releaseDate.substring(0, 4);
        return processReleaseDate;
      } else {
        return "";
      }
    } else {
      return "";
    }
  }

//////////////////////////////////////////////////
  static getPreviewItemMovieModel({required MovieItem? movieItem}) {
    PreviewItemModel previewItemModel = PreviewItemModel(
      id: movieItem?.id,
      backdropPath: movieItem?.backdropPath,
      overview: movieItem?.overview,
      title: movieItem?.title,
      releaseDate: movieItem?.releaseDate,
      voteAverage: movieItem?.voteAverage,
      posterPath: movieItem?.posterPath,
    );
    return previewItemModel;
  }

  static getPreviewItemMovieListModel({required List<MovieItem>? movieItem}) {
    List<PreviewItemModel> previewItemModel = movieItem
            ?.map((item) => PreviewItemModel(
                  id: item.id,
                  backdropPath: item.backdropPath,
                  overview: item.overview,
                  title: item.title,
                  releaseDate: item.releaseDate,
                  voteAverage: item.voteAverage,
                  posterPath: item.posterPath,
                ))
            .toList() ??
        [];
    return previewItemModel;
  }

  static getPreviewItemMovieDetailsModel(
      {required MovieDetailsModel? movieItemDetails}) {
    PreviewItemDetailsModel previewItemModel = PreviewItemDetailsModel(
        backdropPath: movieItemDetails?.backdropPath,
        overview: movieItemDetails?.overview,
        title: movieItemDetails?.title,
        releaseDate: movieItemDetails?.releaseDate,
        voteAverage: movieItemDetails?.voteAverage,
        posterPath: movieItemDetails?.posterPath,
        genres: movieItemDetails?.genres);
    return previewItemModel;
  }

  static getPreviewItemTvShowDetailsModel(
      {required TvShowDetailsModel? tvShowItem}) {
    PreviewItemDetailsModel previewItemModel = PreviewItemDetailsModel(
        backdropPath: tvShowItem?.backdropPath,
        overview: tvShowItem?.overview,
        title: tvShowItem?.originalName,
        releaseDate: tvShowItem?.firstAirDate,
        voteAverage: tvShowItem?.voteAverage,
        posterPath: tvShowItem?.posterPath,
        genres: tvShowItem?.genres,
        season: tvShowItem?.seasons);
    return previewItemModel;
  }

  static getPreviewSeasonTvShowModel({required Season? seasonTvShow}) {
    PreviewItemModel previewItemModel = PreviewItemModel(
      id: seasonTvShow?.id,
      title: seasonTvShow?.name,
      firstAirDate: seasonTvShow?.airDate,
      voteAverage: seasonTvShow?.voteAverage,
      posterPath: seasonTvShow?.posterPath,
    );
    return previewItemModel;
  }

  static getPreviewItemTvShowModel({required TvShowItemModel? tvItem}) {
    PreviewItemModel previewItemModel = PreviewItemModel(
      id: tvItem?.id,
      backdropPath: tvItem?.backdropPath,
      overview: tvItem?.overview,
      title: tvItem?.name,
      firstAirDate: tvItem?.firstAirDate,
      voteAverage: tvItem?.voteAverage,
      posterPath: tvItem?.posterPath,
    );
    return previewItemModel;
  }

  static getPreviewItemListTvShowModel(
      {required List<TvShowItemModel>? tvItem}) {
    List<PreviewItemModel>? previewItemModel = tvItem
            ?.map((item) => PreviewItemModel(
                  id: item.id,
                  backdropPath: item.backdropPath,
                  overview: item.overview,
                  title: item.name,
                  firstAirDate: item.firstAirDate,
                  voteAverage: item.voteAverage,
                  posterPath: item.posterPath,
                ))
            .toList() ??
        [];
    return previewItemModel;
  }
}
