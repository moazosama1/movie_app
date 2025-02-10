import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDio({required DioException dioError}) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errorMessage: "Connection timed out. Please try again.");
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            errorMessage: "Send request timed out. Please try again.");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            errorMessage: "Receive request timed out. Please try again.");
      case DioExceptionType.badCertificate:
        return ServerFailure(
            errorMessage:
                "Bad certificate. The server's certificate is not valid.");
      case DioExceptionType.badResponse:
        return ServerFailure(
            errorMessage: _handleBadResponse(dioError.response));
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "Request was cancelled.");
      case DioExceptionType.connectionError:
        return ServerFailure(
            errorMessage:
                "No internet connection. Please check your connection.");
      case DioExceptionType.unknown:
        return ServerFailure(
            errorMessage: "An unknown error occurred. Please try again.");
    }
  }

  static String _handleBadResponse(Response? response) {
    if (response == null) {
      return "Received an invalid response from the server.";
    }
    switch (response.statusCode) {
      case 400:
        return "Bad request. Please check your input.";
      case 401:
        return "Unauthorized request. Please log in again.";
      case 403:
        return "Access forbidden. You don't have permission to perform this action.";
      case 404:
        return "Resource not found. Please try again.";
      case 500:
        return "Internal server error. Please try again later.";
      default:
        return "Unexpected error occurred. Status code: ${response.statusCode}";
    }
  }
}
