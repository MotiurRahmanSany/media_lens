import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/article.dart';
import 'news_repository_provider.dart';
import '../../../../config/app_config.dart';

part 'headlines_provider.g.dart';

@riverpod
class Headlines extends _$Headlines {
  @override
  Future<List<Article>> build({String? category}) async {
    return _fetchHeadlines(category: category);
  }

  Future<List<Article>> _fetchHeadlines({String? category}) async {
    final repository = ref.read(newsRepositoryProvider);
    return await repository.getTopHeadlines(
      country: AppConfig.defaultCountry,
      category: category,
      pageSize: AppConfig.pageSize,
    );
  }

  Future<void> refresh({String? category}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchHeadlines(category: category));
  }
}
