import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:movie_app/core/api/api_services.dart';
import 'package:movie_app/core/api/api_url.dart';
import 'package:movie_app/core/error/error.dart';
import 'package:movie_app/feature/auth/data/models/account_model/account_model.dart';
import 'package:movie_app/feature/auth/data/models/auth_model/request_token.dart';
import 'package:movie_app/feature/auth/data/models/auth_model/session_model.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/feature/auth/data/repos/auth_repo.dart';

class AuthRepoImpel extends AuthRepo {
  ApiServices apiServices = ApiServices(dio: Dio());
  final storage = FlutterSecureStorage();
  @override
  Future<Either<Failure, RequestTokenModel>> getRequestToken() async {
    try {
      var request =
          await apiServices.get(endPoint: ApiUrl.requestTokenEndPointUrl);
      var response = RequestTokenModel.fromJson(request.data);
      RequestTokenModel requestTokenModel = response;
      return right(requestTokenModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }

  @override
  Future<Either<Failure, SessionModel>> createSessionId(
      {required String requestToken}) async {
    try {
      var request = await apiServices.post(
          endPoint: ApiUrl.sessionIdEndPointUrl, requestToken: requestToken);
      var response = SessionModel.fromJson(request.data);
      SessionModel requestTokenModel = response;
      return right(requestTokenModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }

  @override
  Future<void> uerPermissionUrlLogin({required String requestToken}) async {
    final authUrl =
        "${ApiUrl.userPermissionPointUrl}$requestToken?redirect_to=movie://approved";
    try {
      final result = await FlutterWebAuth.authenticate(
        url: authUrl,
        callbackUrlScheme: "movie",
      );
    } catch (e) {
      if (e is PlatformException && e.code == "CANCELED") {
        print(
            "User closed the authentication browser, but session might be created.");
      } else {
        print("Auth Error: $e");
      }
    }
  }

  @override
  Future<String?> getSessionId() async {
    return await storage.read(key: "session_id");
  }
  @override
  Future<String?> getAccountId() async {
    return await storage.read(key: "account_id");
  }

  @override
  Future<void> logoutAccount() async {
    await storage.delete(key: "session_id");
    await storage.delete(key: "account_id");
  }

  @override
  Future<Either<Failure, AccountModel>> getAccountInfo(
      {required String sessionId}) async {
    try {
      var request = await apiServices.get(
          endPoint: "${ApiUrl.getAccountEndPointUrl}$sessionId");
      var response = AccountModel.fromJson(request.data);
      AccountModel accountModel = response;
      return right(accountModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(dioError: e));
      } else {
        return left(ServerFailure(errorMessage: commonError));
      }
    }
  }
}
