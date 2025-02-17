part of 'tv_list_cubit.dart';

@immutable
sealed class TvListState {}

final class TvListInitial extends TvListState {}

final class TvListSuccess extends TvListState {
  final List<TvShowItemModel>? topRatedTv;
  final List<TvShowItemModel>? tvList;
  final List<TvShowItemModel>? tvTrendingList;
  final List<TvShowItemModel>? tvAiringTodayList;
  TvListSuccess(
      {this.tvAiringTodayList,
      this.topRatedTv,
      this.tvList,
      this.tvTrendingList});
}

final class TvListLoading extends TvListState {}

final class TvListFailure extends TvListState {
  final String errorMessage;

  TvListFailure({required this.errorMessage});
}
