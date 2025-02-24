class PreviewItemModel {
  final int? id;
  final String? posterPath;
  final String? backdropPath;
  final String? title;
  final String? originalName;
  final String? overview;
  final String? releaseDate;
  final double? voteAverage;
  final String? firstAirDate;

  PreviewItemModel({
    this.originalName,
    this.firstAirDate,
    this.posterPath,
    this.voteAverage,
    this.releaseDate,
    this.id,
    this.backdropPath,
    this.title,
    this.overview,
  });

  factory PreviewItemModel.fromJson(Map<String, dynamic> json) {
    return PreviewItemModel(
      id: json['id'] as int?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      title: json['title'] as String?,
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      firstAirDate: json['first_air_date'] as String?,
    );
  }
}
