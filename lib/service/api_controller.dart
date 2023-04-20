import 'package:dio/dio.dart';
import 'package:project_test/config/back_end.dart';

class BaseApi {
  static Dio? _dio;
  static const String _url = BackendHost.BACKEND_HTTP;

  BaseApi._();
  static final BaseApi instance = BaseApi._();

  init() {
    _dio = Dio(BaseOptions(
      baseUrl: _url,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    ));
    return "Success";
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dio!.get(path, queryParameters: queryParameters);
  }

  Future<Response> getData(
    String path,
  ) async {
    try {
      var response =
          await Dio(BaseOptions(headers: {"Content-Type": "application/json"}))
              .get('$path');
      return response;
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
