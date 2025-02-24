import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/feature/auth/data/repos/auth_repo.dart';
import 'package:movie_app/feature/auth/data/repos/auth_repo_impl.dart';
part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(AuthCubitInitial());
  AuthRepo authRepo = AuthRepoImpel();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  Future<void> authenticateUser() async {
    emit(AuthCubitLoading());

    var createToken = await authRepo.getRequestToken();
    String? requestToken;

    createToken.fold(
      (l) {
        emit(AuthCubitFailure(errorMessage: l.errorMessage));
        return;
      },
      (r) {
        requestToken = r.requestToken;
      },
    );

    if (requestToken == null) return;

    await authRepo.uerPermissionUrlLogin(requestToken: requestToken!);

    final sessionResult =
        await authRepo.createSessionId(requestToken: requestToken!);
    String? sessionId;
    int? accountId;
    sessionResult.fold(
      (l) {
        emit(AuthCubitFailure(errorMessage: l.errorMessage));
        return;
      },
      (r) {
        sessionId = r.sessionId;
      },
    );

    if (sessionId == null) return;
    final accountInfo = await authRepo.getAccountInfo(sessionId: sessionId!);

    accountInfo.fold(
      (l) {
        emit(AuthCubitFailure(errorMessage: l.errorMessage));
        return;
      },
      (r) {
        accountId = r.id;
      },
    );
    if (accountId == null) return;
    await secureStorage.write(key: "session_id", value: sessionId);
    await secureStorage.write(key: "account_id", value: accountId.toString());
    emit(AuthCubitSuccess());
  }
}
