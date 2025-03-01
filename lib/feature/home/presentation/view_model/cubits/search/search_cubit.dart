import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';
import 'package:movie_app/feature/home/data/repos/search/search_repo.dart';
import 'package:movie_app/feature/home/data/repos/search/search_repo_impl.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  SearchRepo searchRepo = SearchRepoImpl();
  List<PreviewItemModel>? multiSearch = [];

  void searchMultiItem(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());
    var data = await searchRepo.searchMultiItem(query: query);
    data.fold(
      (l) {
        emit(SearchFailure(errorMessage: l.errorMessage));
      },
      (r) {
        multiSearch = r;
        emit(SearchSuccess(multiSearch: r));
      },
    );
  }
}
