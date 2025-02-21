import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/error.dart';
import 'package:movie_app/feature/auth/data/models/account_model/account_model.dart';
import 'package:movie_app/feature/auth/data/models/auth_model/request_token.dart';
import 'package:movie_app/feature/auth/data/models/auth_model/session_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, RequestTokenModel>> getRequestToken();
  Future<Either<Failure, SessionModel>> createSessionId(
      {required String requestToken});
  Future<Either<Failure, AccountModel>> getAccountInfo(
      {required String sessionId});
  Future<void> uerPermissionUrlLogin({required String requestToken});
  Future<String?> getSessionId();
  Future<String?> getAccountId();
  Future<void> logoutAccount();
}
