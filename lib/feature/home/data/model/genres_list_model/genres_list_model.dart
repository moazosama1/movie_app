import 'genre.dart';

class GenresListModel {
  List<GenreItem>? genres;

  GenresListModel({this.genres});

  factory GenresListModel.fromJson(Map<String, dynamic> json) {
    return GenresListModel(
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'genres': genres?.map((e) => e.toJson()).toList(),
      };
}
