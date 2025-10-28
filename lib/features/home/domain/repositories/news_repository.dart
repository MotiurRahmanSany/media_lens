import '../../../home/domain/entities/article.dart';

abstract class NewsRepository {
  Future<List<Article>> getTopHeadlines({
    String? country,
    String? category,
    String? sources,
    String? q,
    int? pageSize,
    int? page,
  });

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
  });
}
