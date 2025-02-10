import 'package:movie_app/feature/home/data/model/tv_show_list_model/tv_show_item.dart';

class TvShowListModel {
  int? page;
  List<TvShowItemModel>? results;
  int? totalPages;
  int? totalResults;

  TvShowListModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  TvShowListModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <TvShowItemModel>[];
      json['results'].forEach((v) {
        results!.add(new TvShowItemModel.fromJson(v));
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
