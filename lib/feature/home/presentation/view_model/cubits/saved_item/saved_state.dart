part of 'saved_cubit.dart';

@immutable
sealed class SavedState {}

final class SavedInitial extends SavedState {}

final class SavedSuccess extends SavedState {
  final AccountModel? accountModel;
  final List<MovieItem>? movieSaved;
  final List<TvShowItemModel>? tvShowSaved;

  SavedSuccess({this.accountModel, this.movieSaved, this.tvShowSaved});
}

final class SavedLoading extends SavedState {}

final class SavedFailure extends SavedState {
  final String errorMessage;

  SavedFailure({required this.errorMessage});
}
