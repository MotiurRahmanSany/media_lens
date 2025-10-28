import '../../domain/entities/article.dart';
import '../../domain/repositories/news_repository.dart';
import '../../../../core/common/services/news_api_service.dart';
import '../../../../core/utils/logger.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsApiService _apiService;

  NewsRepositoryImpl(this._apiService);

  @override
  Future<List<Article>> getTopHeadlines({
    String? country,
    String? category,
    String? sources,
    String? q,
    int? pageSize,
    int? page,
  }) async {
    try {
      Logger.log(
        'Fetching top headlines - category: $category, country: $country',
        tag: 'Repository',
      );

      final response = await _apiService.getTopHeadlines(
        country: country,
        category: category,
        sources: sources,
        q: q,
        pageSize: pageSize,
        page: page,
      );

      Logger.success(
        'Fetched ${response.articles.length} articles',
        tag: 'Repository',
      );
      return response.articles;
    } catch (e) {
      Logger.error('Error fetching top headlines', tag: 'Repository', error: e);
      rethrow;
    }
  }

  @override
  Future<List<Article>> searchNews({
    required String q,
    String? searchIn,
    String? sources,
    String? domains,
    String? from,
    String? to,
    String? language,
    String? sortBy,
    int? pageSize,
    int? page,
  }) async {
    try {
      Logger.log('Searching news - query: $q', tag: 'Repository');

      final response = await _apiService.searchNews(
        q: q,
        searchIn: searchIn,
        sources: sources,
        domains: domains,
        from: from,
        to: to,
        language: language,
        sortBy: sortBy,
        pageSize: pageSize,
        page: page,
      );

      Logger.success(
        'Found ${response.articles.length} articles',
        tag: 'Repository',
      );
      return response.articles;
    } catch (e) {
      Logger.error('Error searching news', tag: 'Repository', error: e);
      rethrow;
    }
  }
}
