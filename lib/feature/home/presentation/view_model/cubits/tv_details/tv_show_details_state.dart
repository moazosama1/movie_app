part of 'tv_show_details_cubit.dart';

@immutable
sealed class TvShowDetailsState {}

final class TvShowDetailsInitial extends TvShowDetailsState {}

final class TvShowDetailsLoading extends TvShowDetailsState {}

final class TvShowDetailsSuccess extends TvShowDetailsState {
  final TvShowDetailsModel? tvShowDetailsModel;
  final List<TvShowItemModel>? similarTvList;
  TvShowDetailsSuccess({
    this.tvShowDetailsModel,
    this.similarTvList,
  });
}

final class TvShowDetailsFailure extends TvShowDetailsState {
  final String errorMessage;

  TvShowDetailsFailure({required this.errorMessage});
}
