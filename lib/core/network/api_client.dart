import 'package:dio/dio.dart';
import 'package:my_learning/core/constants/api_constants.dart';

class ApiClient {
  late final Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  Future<Response> get(String path, Map<String, dynamic>? body) async {
    return _dio.get(path, data: body);
  }

  Future<Response> post(String path, Map<String, dynamic>? body) async {
    return _dio.post(path, data: body);
  }
}
