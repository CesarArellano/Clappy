import 'package:dio/dio.dart';

enum NetworkErrorType {
  timeout,
  noConnection,
  cancelled,
  badCertificate,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  rateLimited,
  serverError,
  unknown,
}

class NetworkException implements Exception {
  factory NetworkException.fromDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return NetworkException(NetworkErrorType.timeout, error: exception);
      case DioExceptionType.connectionError:
        return NetworkException(
          NetworkErrorType.noConnection,
          error: exception,
        );
      case DioExceptionType.cancel:
        return NetworkException(
          NetworkErrorType.cancelled,
          error: exception,
        );
      case DioExceptionType.badCertificate:
        return NetworkException(
          NetworkErrorType.badCertificate,
          error: exception,
        );
      case DioExceptionType.badResponse:
        return NetworkException(
          _typeForStatusCode(exception.response?.statusCode),
          statusCode: exception.response?.statusCode,
          error: exception,
        );
      case DioExceptionType.unknown:
        return NetworkException(NetworkErrorType.unknown, error: exception);
    }
  }
  const NetworkException(this.type, {this.statusCode, this.error});

  final NetworkErrorType type;
  final int? statusCode;
  final Object? error;

  static NetworkErrorType _typeForStatusCode(int? statusCode) {
    return switch (statusCode) {
      400 => NetworkErrorType.badRequest,
      401 => NetworkErrorType.unauthorized,
      403 => NetworkErrorType.forbidden,
      404 => NetworkErrorType.notFound,
      429 => NetworkErrorType.rateLimited,
      _ when statusCode != null && statusCode >= 500 =>
        NetworkErrorType.serverError,
      _ => NetworkErrorType.unknown,
    };
  }

  @override
  String toString() =>
      'NetworkException: $type${statusCode != null ? ' ($statusCode)' : ''}';
}
