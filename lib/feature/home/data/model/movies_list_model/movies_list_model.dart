import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';

class MoviesListModel {
  int? page;
  List<MovieItem>? results;
  int? totalPages;
  int? totalResults;

  MoviesListModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  MoviesListModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <MovieItem>[];
      json['results'].forEach((v) {
        results!.add(new MovieItem.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}
