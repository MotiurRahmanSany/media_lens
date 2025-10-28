class ApiConstants {
  // News Categories
  static const List<String> categories = [
    'general',
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology',
  ];

  // Countries
  static const Map<String, String> countries = {
    'us': 'United States',
    'gb': 'United Kingdom',
    'ca': 'Canada',
    'au': 'Australia',
    'in': 'India',
    'ae': 'UAE',
    'de': 'Germany',
    'fr': 'France',
    'jp': 'Japan',
    'cn': 'China',
  };

  // Languages
  static const Map<String, String> languages = {
    'en': 'English',
    'ar': 'Arabic',
    'de': 'German',
    'es': 'Spanish',
    'fr': 'French',
    'it': 'Italian',
    'ja': 'Japanese',
    'pt': 'Portuguese',
    'ru': 'Russian',
    'zh': 'Chinese',
  };

  // Sort Options
  static const List<String> sortOptions = [
    'publishedAt',
    'relevancy',
    'popularity',
  ];

  // API Error Codes
  static const String apiKeyInvalid = 'apiKeyInvalid';
  static const String apiKeyExhausted = 'apiKeyExhausted';
  static const String apiKeyMissing = 'apiKeyMissing';
  static const String parameterInvalid = 'parameterInvalid';
  static const String rateLimited = 'rateLimited';
  static const String sourceDoesNotExist = 'sourceDoesNotExist';
  static const String unexpectedError = 'unexpectedError';
}
