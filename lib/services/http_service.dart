import 'package:dio/dio.dart';
import 'package:pgn_revamp/core/constants/api_constant.dart';

class HttpService {
  late Dio _dio;
  late String _authToken;

  String get authToken => _authToken;

  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      // headers: {
      //   'Accept': 'application/json',
      //   'Content-Type': 'application/json',
      //   'authorizationType': 'token',
      // },
      connectTimeout: const Duration(milliseconds: 15000),
      receiveTimeout: const Duration(milliseconds: 30000),
    ));

    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  void setToken({required String token}) {
    _dio.options.headers['Authorization'] = "Bearer $token";
    _authToken = "Bearer $token";
  }

  void removeToken() {
    _dio.options.headers['Authorization'] = null;
  }

  void setContentTypeImage() {
    _dio.options.headers['Content-Type'] = "image/jpeg";
  }

  void setContentTypeJson() {
    _dio.options.headers['Content-Type'] = "application/json";
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException(e.message ?? 'Timeout error occurred');
      case DioExceptionType.badResponse:
        return ServerException(e.message ?? 'Server error occurred');
      case DioExceptionType.cancel:
        return RequestCancelledException(e.message ?? 'Request was cancelled');
      case DioExceptionType.badCertificate:
        return CertificateException(e.message ?? 'Certificate error occurred');
      case DioExceptionType.unknown:
        return UnknownException(e.message ?? 'An unknown error occurred');
      default:
        return UnknownException('An unexpected error occurred');
    }
  }
}

class TimeoutException implements Exception {
  final String message;
  TimeoutException(this.message);
}

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

class RequestCancelledException implements Exception {
  final String message;
  RequestCancelledException(this.message);
}

class CertificateException implements Exception {
  final String message;
  CertificateException(this.message);
}

class UnknownException implements Exception {
  final String message;
  UnknownException(this.message);
}
