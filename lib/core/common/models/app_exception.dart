class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic details;

  AppException({required this.message, this.code, this.details});

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  NetworkException({String? message})
    : super(message: message ?? 'No internet connection');
}

class ApiException extends AppException {
  ApiException({required super.message, super.code, super.details});
}

class UnauthorizedException extends AppException {
  UnauthorizedException({String? message})
    : super(message: message ?? 'Unauthorized access');
}

class NotFoundException extends AppException {
  NotFoundException({String? message})
    : super(message: message ?? 'Resource not found');
}

class ServerException extends AppException {
  ServerException({String? message})
    : super(message: message ?? 'Server error occurred');
}

class TimeoutException extends AppException {
  TimeoutException({String? message})
    : super(message: message ?? 'Request timeout');
}

class RateLimitException extends AppException {
  RateLimitException({String? message})
    : super(message: message ?? 'Rate limit exceeded. Please try again later.');
}

class CacheException extends AppException {
  CacheException({String? message})
    : super(message: message ?? 'Cache error occurred');
}
