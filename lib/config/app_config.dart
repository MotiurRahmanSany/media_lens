import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  // API Configuration
  static const String baseUrl = 'https://newsapi.org/v2';
  static String get apiKey => dotenv.env['API_KEY'] ?? '';

  // API Endpoints
  static const String topHeadlines = '/top-headlines';
  static const String everything = '/everything';
  static const String sources = '/top-headlines/sources';

  // App Configuration
  static const int requestTimeout = 30000; // 30 seconds
  static const int pageSize = 20;
  static const int maxPageSize = 100;

  // Default values
  static const String defaultCountry = 'us';
  static const String defaultLanguage = 'en';
  static const String defaultSortBy = 'publishedAt';
}
