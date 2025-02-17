import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/feature/home/data/model/tv_show_list_model/tv_show_item.dart';
import 'package:movie_app/feature/home/data/repos/tv/tv_repo.dart';
import 'package:movie_app/feature/home/data/repos/tv/tv_repo_impel.dart';

part 'tv_list_state.dart';

class TvListCubit extends Cubit<TvListState> {
  TvListCubit() : super(TvListInitial());
  TvRepo tvRepo = TvRepoImpel();
  Future<void> getTvAllData() async {
    emit(TvListLoading());
    final topRatedTvShowFuture = tvRepo.getListTvShowTopRatedItems();
    final tvTrendingFuture = tvRepo.getListTvShowTrendingItems();
    final tvAiringTodayFuture = tvRepo.getListTvShowAiringTodayItems();
    final tvShowListFuture = tvRepo.getListTvShowItems(categoryId: "10759");
    final result = await Future.wait([
      topRatedTvShowFuture,
      tvShowListFuture,
      tvTrendingFuture,
      tvAiringTodayFuture
    ]);
    List<TvShowItemModel>? topRatedTvList = [];
    List<TvShowItemModel>? tvList = [];
    List<TvShowItemModel>? tvTrendingList = [];
    List<TvShowItemModel>? tvAiringTodayList = [];
    result[0].fold(
      (l) => emit(TvListFailure(errorMessage: l.errorMessage)),
      (r) => topRatedTvList = (r ?? []).cast<TvShowItemModel>(),
    );

    result[1].fold(
      (l) => emit(TvListFailure(errorMessage: l.errorMessage)),
      (r) => tvList = (r ?? []).cast<TvShowItemModel>(),
    );
    result[2].fold(
      (l) => emit(TvListFailure(errorMessage: l.errorMessage)),
      (r) => tvTrendingList = (r ?? []).cast<TvShowItemModel>(),
    );
    result[3].fold(
      (l) => emit(TvListFailure(errorMessage: l.errorMessage)),
      (r) => tvAiringTodayList = (r ?? []).cast<TvShowItemModel>(),
    );
    emit(TvListSuccess(
        topRatedTv: topRatedTvList,
        tvList: tvList,
        tvTrendingList: tvTrendingList,
        tvAiringTodayList: tvAiringTodayList));
  }
}
