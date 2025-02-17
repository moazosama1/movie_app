class PreviewItemModel {
  final int? id;
  final String? posterPath;
  final String? backdropPath;
  final String? title;
  final String? overview;
  final String? releaseDate;
  final double? voteAverage;
  final String? firstAirDate;

  PreviewItemModel({
    this.firstAirDate,
    this.posterPath,
    this.voteAverage,
    this.releaseDate,
    this.id,
    this.backdropPath,
    this.title,
    this.overview,
  });
}
