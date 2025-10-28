import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../home/domain/entities/article.dart';
import '../../../home/presentation/controllers/news_repository_provider.dart';
import '../../../../config/app_config.dart';

part 'search_provider.g.dart';

@riverpod
class SearchNews extends _$SearchNews {
  @override
  Future<List<Article>> build() async {
    return [];
  }

  Future<void> search(String query) async {
    if (query.isEmpty) {
      state = const AsyncValue.data([]);
      return;
    }

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(newsRepositoryProvider);
      return await repository.searchNews(
        q: query,
        language: AppConfig.defaultLanguage,
        sortBy: AppConfig.defaultSortBy,
        pageSize: AppConfig.pageSize,
      );
    });
  }

  void clear() {
    state = const AsyncValue.data([]);
  }
}
