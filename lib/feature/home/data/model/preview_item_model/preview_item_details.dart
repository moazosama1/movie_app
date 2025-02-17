import 'package:movie_app/feature/home/data/model/genres_list_model/genre.dart';
import 'package:movie_app/feature/home/data/model/tv_show_details_model/season.dart';

class PreviewItemDetailsModel {
  final int? id;
  final String? posterPath;
  final String? backdropPath;
  final String? title;
  final String? overview;
  final String? releaseDate;
  final double? voteAverage;
  final List<Genre>? genres;
  final List<Season>? season;
  PreviewItemDetailsModel({
    this.season,
    this.genres,
    this.posterPath,
    this.voteAverage,
    this.releaseDate,
    this.id,
    this.backdropPath,
    this.title,
    this.overview,
  });
}
