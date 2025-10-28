import 'package:dio/dio.dart';
import '../../../config/app_config.dart';
import '../../../core/utils/logger.dart';
import '../../../core/common/models/app_exception.dart';
import '../../../features/home/data/models/news_response.dart';

class NewsApiService {
  final Dio _dio;

  NewsApiService(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: Duration(milliseconds: AppConfig.requestTimeout),
      receiveTimeout: Duration(milliseconds: AppConfig.requestTimeout),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    // Add interceptors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add API key to all requests
          options.queryParameters['apiKey'] = AppConfig.apiKey;
          Logger.log('REQUEST: ${options.method} ${options.uri}', tag: 'API');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          Logger.success(
            'RESPONSE: ${response.statusCode} ${response.requestOptions.uri}',
            tag: 'API',
          );
          return handler.next(response);
        },
        onError: (error, handler) {
          Logger.error('ERROR: ${error.message}', tag: 'API', error: error);
          return handler.next(error);
        },
      ),
    );
  }

  /// Get top headlines
  Future<NewsResponse> getTopHeadlines({
    String? country,
    String? category,
    String? sources,
    String? q,
    int? pageSize,
    int? page,
  }) async {
    try {
      final response = await _dio.get(
        AppConfig.topHeadlines,
        queryParameters: {
          if (country != null) 'country': country,
          if (category != null) 'category': category,
          if (sources != null) 'sources': sources,
          if (q != null) 'q': q,
          if (pageSize != null) 'pageSize': pageSize,
          if (page != null) 'page': page,
        },
      );

      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// Search for news articles
  Future<NewsResponse> searchNews({
    required String q,
    String? searchIn,
    String? sources,
    String? domains,
    String? excludeDomains,
    String? from,
    String? to,
    String? language,
    String? sortBy,
    int? pageSize,
    int? page,
  }) async {
    try {
      final response = await _dio.get(
        AppConfig.everything,
        queryParameters: {
          'q': q,
          if (searchIn != null) 'searchIn': searchIn,
          if (sources != null) 'sources': sources,
          if (domains != null) 'domains': domains,
          if (excludeDomains != null) 'excludeDomains': excludeDomains,
          if (from != null) 'from': from,
          if (to != null) 'to': to,
          if (language != null) 'language': language,
          if (sortBy != null) 'sortBy': sortBy,
          if (pageSize != null) 'pageSize': pageSize,
          if (page != null) 'page': page,
        },
      );

      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// Handle successful response
  NewsResponse _handleResponse(Response response) {
    if (response.data['status'] == 'error') {
      throw ApiException(
        message: response.data['message'] ?? 'Unknown error',
        code: response.data['code'],
      );
    }
    return NewsResponse.fromJson(response.data);
  }

  /// Handle Dio errors
  AppException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException(message: 'Request timeout. Please try again.');

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;

        if (statusCode == 401) {
          return UnauthorizedException(
            message: data?['message'] ?? 'API key is invalid',
          );
        } else if (statusCode == 429) {
          return RateLimitException(
            message: data?['message'] ?? 'Rate limit exceeded',
          );
        } else if (statusCode == 404) {
          return NotFoundException(
            message: data?['message'] ?? 'Resource not found',
          );
        } else if (statusCode != null && statusCode >= 500) {
          return ServerException(message: data?['message'] ?? 'Server error');
        }

        return ApiException(
          message: data?['message'] ?? 'An error occurred',
          code: data?['code'],
        );

      case DioExceptionType.connectionError:
        return NetworkException(message: 'No internet connection');

      case DioExceptionType.cancel:
        return AppException(message: 'Request cancelled');

      default:
        return AppException(
          message: error.message ?? 'An unexpected error occurred',
        );
    }
  }
}
