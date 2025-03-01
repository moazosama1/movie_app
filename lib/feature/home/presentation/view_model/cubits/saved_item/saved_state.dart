part of 'saved_cubit.dart';

@immutable
sealed class SavedState {}

final class SavedInitial extends SavedState {}

final class SavedSuccess extends SavedState {
  final List<MovieItem>? movieSaved;
  final List<TvShowItemModel>? tvShowSaved;

  SavedSuccess({this.movieSaved, this.tvShowSaved});
}

final class SavedLoading extends SavedState {}

final class SavedFailure extends SavedState {
  final String errorMessage;

  SavedFailure({required this.errorMessage});
}
