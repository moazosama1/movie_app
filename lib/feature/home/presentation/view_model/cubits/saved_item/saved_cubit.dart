import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/feature/auth/data/models/auth_model/favorite_request_model.dart';
import 'package:movie_app/feature/auth/data/repos/auth_repo.dart';
import 'package:movie_app/feature/auth/data/repos/auth_repo_impl.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/data/model/tv_show_list_model/tv_show_item.dart';
import 'package:movie_app/feature/home/data/repos/favorite/favorite_repo.dart';
import 'package:movie_app/feature/home/data/repos/favorite/favorite_repo_impl.dart';
part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(SavedInitial());
  AuthRepo authRepo = AuthRepoImpel();
  FavoriteRepo favoriteRepo = FavoriteRepoImpl();
  List<MovieItem>? movieSaved = [];
  List<TvShowItemModel>? tvShowSaved = [];
  getAccountId() async {
    String? accountIdString = await authRepo.getAccountId();
    if (accountIdString == null) {
      return 0;
    } else {
      int? accountId = int.tryParse(accountIdString);
      return accountId;
    }
  }

  deleteItemsToFavorite(
      {required FavoriteRequestModel? addFavoriteModel}) async {
    emit(SavedLoading());
    int? accountId = await getAccountId();
    var data = await favoriteRepo.favoriteAccount(
        accountId: accountId!, addFavoriteModel: addFavoriteModel);
    data.fold(
      (l) {
        emit(SavedFailure(errorMessage: l.errorMessage));
      },
      (r) {
        emit(SavedSuccess());
      },
    );
  }

  Future<void> getWatchAllData() async {
    emit(SavedLoading());
    int? accountId = await getAccountId();
    final movieFavoritesFuture =
        favoriteRepo.getMovieFavorite(accountId: accountId!);
    final tvFavoritesFuture =
        favoriteRepo.getTvShowFavorite(accountId: accountId);
    final result = await Future.wait([
      movieFavoritesFuture,
      tvFavoritesFuture,
    ]);
    List<MovieItem>? movieFavorites = [];
    List<TvShowItemModel>? tvFavorites = [];
    result[0].fold(
      (l) => emit(SavedFailure(errorMessage: l.errorMessage)),
      (r) => movieFavorites = (r ?? []) as List<MovieItem>,
    );

    result[1].fold(
      (l) => emit(SavedFailure(errorMessage: l.errorMessage)),
      (r) => tvFavorites = (r ?? []) as List<TvShowItemModel>,
    );
    movieSaved = movieFavorites;
    tvShowSaved = tvFavorites;
    emit(SavedSuccess(
      movieSaved: movieFavorites,
      tvShowSaved: tvFavorites,
    ));
  }

}
