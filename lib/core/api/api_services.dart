import 'package:dio/dio.dart';
import 'package:movie_app/core/api/api_key.dart';
import 'package:movie_app/core/api/api_url.dart';

class ApiServices {
  final Dio dio;
  
  ApiServices({required this.dio});
  Future<Response> get({required String endPoint}) async {
    var response = await dio.get("${ApiUrl.baseUrl}$endPoint",
        options: Options(headers: {
          "Authorization": "Bearer ${ApiKey.token}",
        }));
    return response;
  }
}
