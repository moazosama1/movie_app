import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/feature/auth/data/models/account_model/account_model.dart';
import 'package:movie_app/feature/auth/data/models/auth_model/favorite_request_model.dart';
import 'package:movie_app/feature/auth/data/repos/auth_repo.dart';
import 'package:movie_app/feature/auth/data/repos/auth_repo_impl.dart';
import 'package:movie_app/feature/home/data/repos/favorite/favorite_repo.dart';
import 'package:movie_app/feature/home/data/repos/favorite/favorite_repo_impl.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());
  AuthRepo authRepo = AuthRepoImpel();
  FavoriteRepo favoriteRepo = FavoriteRepoImpl();
  AccountModel? accountModel = AccountModel();
  getAccountId() async {
    String? accountIdString = await authRepo.getAccountId();
    if (accountIdString == null) {
      return 0;
    } else {
      int? accountId = int.tryParse(accountIdString);
      return accountId;
    }
  }

  addItemsToFavorite({required FavoriteRequestModel? addFavoriteModel}) async {
    emit(AccountAddItemLoading());
    int? accountId = await getAccountId();
    var data = await favoriteRepo.favoriteAccount(
        accountId: accountId!, addFavoriteModel: addFavoriteModel);
    data.fold(
      (l) {
        emit(AccountFailure(errorMessage: l.errorMessage));
      },
      (r) {
        emit(AccountSuccess());
      },
    );
  }

  getAccountInfo() async {
    emit(AccountLoading());
    int? accountId = await getAccountId();
    var data = await authRepo.getAccountInfoById(accountId: accountId!);
    data.fold(
      (l) => emit(AccountFailure(errorMessage: l.errorMessage)),
      (r) => emit(AccountSuccess(accountModel: r)),
    );
  }

  Future<void> logoutAccount() async {
    var sessionId = await authRepo.getSessionId();
    await authRepo.deleteSession(sessionId: sessionId!);
    await authRepo.logoutAccount();
  }
}
