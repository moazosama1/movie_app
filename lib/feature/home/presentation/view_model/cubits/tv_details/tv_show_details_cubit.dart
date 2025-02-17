import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/error/error.dart';
import 'package:movie_app/feature/home/data/model/tv_show_details_model/tv_show_details_model.dart';
import 'package:movie_app/feature/home/data/model/tv_show_list_model/tv_show_item.dart';
import 'package:movie_app/feature/home/data/repos/tv/tv_repo.dart';
import 'package:movie_app/feature/home/data/repos/tv/tv_repo_impel.dart';

part 'tv_show_details_state.dart';

class TvShowDetailsCubit extends Cubit<TvShowDetailsState> {
  TvShowDetailsCubit() : super(TvShowDetailsInitial());
  TvRepo tvRepo = TvRepoImpel();
  getTvShowDetails({required int tvId}) async {
    emit(TvShowDetailsLoading());
    var data = await tvRepo.getTvShowDetailsItems(id: tvId);
    data.fold(
      (l) => emit(TvShowDetailsFailure(errorMessage: l.errorMessage)),
      (r) {
        emit(TvShowDetailsSuccess(tvShowDetailsModel: r));
      },
    );
  }

  Future<void> gitTvShowDetailsAllInfo({required int tvId}) async {
    emit(TvShowDetailsLoading());

    final tvShowDetailsFuture = tvRepo.getTvShowDetailsItems(id: tvId);
    final similarTvShowFuture = tvRepo.getSimilarListTvShowItems(id: tvId);
    final recommendationsTvShowFuture =
        tvRepo.getRecommendationsListTvShowItems(id: tvId);

    final results = await Future.wait([
      tvShowDetailsFuture,
      similarTvShowFuture,
      recommendationsTvShowFuture
    ]);

    final tvDetailsEither = results[0] as Either<Failure, TvShowDetailsModel?>;
    final similarEither = results[1] as Either<Failure, List<TvShowItemModel>?>;
    final recommendationsEither =
        results[2] as Either<Failure, List<TvShowItemModel>?>;

    TvShowDetailsModel? itemTvShowDetails;
    List<TvShowItemModel>? similarList;
    List<TvShowItemModel>? recommendationsList;

    tvDetailsEither.fold(
      (l) {
        emit(TvShowDetailsFailure(errorMessage: l.errorMessage));
        return;
      },
      (r) => itemTvShowDetails = r,
    );

    similarEither.fold(
      (l) {
        emit(TvShowDetailsFailure(errorMessage: l.errorMessage));
        return;
      },
      (r) => similarList = r,
    );
    recommendationsEither.fold(
      (l) {
        emit(TvShowDetailsFailure(errorMessage: l.errorMessage));
        return;
      },
      (r) => recommendationsList = r,
    );

    if (itemTvShowDetails != null && similarList != null) {
      emit(TvShowDetailsSuccess(
          similarTvList: similarList,
          tvShowDetailsModel: itemTvShowDetails,
          recommendationsTvList: recommendationsList));
    }
  }
}
