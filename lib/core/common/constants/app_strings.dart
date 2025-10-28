class AppStrings {
  // App Name
  static const String appName = 'Media Lens';
  static const String appTagline = 'Your Window to the World';

  // Screen Titles
  static const String homeTitle = 'Top Headlines';
  static const String searchTitle = 'Search News';
  static const String detailsTitle = 'Article Details';
  static const String settingsTitle = 'Settings';

  // Categories
  static const Map<String, String> categoryNames = {
    'general': 'General',
    'business': 'Business',
    'entertainment': 'Entertainment',
    'health': 'Health',
    'science': 'Science',
    'sports': 'Sports',
    'technology': 'Technology',
  };

  // Actions
  static const String refresh = 'Refresh';
  static const String search = 'Search';
  static const String readMore = 'Read More';
  static const String share = 'Share';
  static const String openInBrowser = 'Open in Browser';
  static const String retry = 'Retry';
  static const String cancel = 'Cancel';

  // Hints
  static const String searchHint = 'Search for news...';
  static const String noResults = 'No results found';
  static const String pullToRefresh = 'Pull to refresh';

  // Messages
  static const String loading = 'Loading...';
  static const String noInternet = 'No internet connection';
  static const String somethingWentWrong = 'Something went wrong';
  static const String apiKeyError =
      'API key error. Please check configuration.';
  static const String rateLimitError =
      'Rate limit exceeded. Please try again later.';
  static const String noArticlesFound = 'No articles found';

  // Time
  static const String justNow = 'Just now';
  static const String minutesAgo = 'minutes ago';
  static const String hoursAgo = 'hours ago';
  static const String daysAgo = 'days ago';
  static const String weeksAgo = 'weeks ago';
  static const String monthsAgo = 'months ago';
}
