import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/error/error.dart';
import 'package:movie_app/feature/home/data/model/movie_details_model/movie_details_model.dart';
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

    final results =
        await Future.wait([tvShowDetailsFuture, similarTvShowFuture]);

    final movieDetailsEither =
        results[0] as Either<Failure, TvShowDetailsModel?>;
    final similarMoviesEither =
        results[1] as Either<Failure, List<TvShowItemModel>?>;

    TvShowDetailsModel? itemTvShowDetails;
    List<TvShowItemModel>? similarList;

    movieDetailsEither.fold(
      (l) {
        emit(TvShowDetailsFailure(errorMessage: l.errorMessage));
        return;
      },
      (r) => itemTvShowDetails = r,
    );

    similarMoviesEither.fold(
      (l) {
        emit(TvShowDetailsFailure(errorMessage: l.errorMessage));
        return;
      },
      (r) => similarList = r,
    );

    if (itemTvShowDetails != null && similarList != null) {
      emit(TvShowDetailsSuccess(
          similarTvList: similarList, tvShowDetailsModel: itemTvShowDetails));
    }
  }
}
