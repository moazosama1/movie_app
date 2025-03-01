part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<PreviewItemModel>? multiSearch;

  SearchSuccess({ this.multiSearch});
}

final class SearchLoading extends SearchState {}

final class SearchFailure extends SearchState {
  final String errorMessage;

  SearchFailure({required this.errorMessage});
}
