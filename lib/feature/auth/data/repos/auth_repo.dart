import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/error.dart';
import 'package:movie_app/feature/auth/data/models/account_model/account_model.dart';
import 'package:movie_app/feature/auth/data/models/auth_model/favorite_request_model.dart';
import 'package:movie_app/feature/auth/data/models/auth_model/favorite_response_model.dart';
import 'package:movie_app/feature/auth/data/models/auth_model/request_token.dart';
import 'package:movie_app/feature/auth/data/models/auth_model/session_model.dart';
import 'package:movie_app/feature/home/data/model/movies_list_model/list_of_result.dart';
import 'package:movie_app/feature/home/data/model/tv_show_list_model/tv_show_item.dart';

abstract class AuthRepo {
  Future<Either<Failure, RequestTokenModel>> getRequestToken();
  Future<Either<Failure, SessionModel>> createSessionId(
      {required String requestToken});
  Future<Either<Failure, AccountModel>> getAccountInfo(
      {required String sessionId});
  Future<void> deleteSession({required String sessionId});
  Future<Either<Failure, AccountModel>> getAccountInfoById(
      {required int accountId});
  Future<void> uerPermissionUrlLogin({required String requestToken});
  Future<String?> getSessionId();
  Future<String?> getAccountId();
  Future<void> logoutAccount();
}
