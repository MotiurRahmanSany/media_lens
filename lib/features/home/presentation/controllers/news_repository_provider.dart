import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/news_repository_impl.dart';
import '../../domain/repositories/news_repository.dart';
import '../../../../core/providers/dio_provider.dart';

part 'news_repository_provider.g.dart';

@riverpod
NewsRepository newsRepository(Ref ref) {
  final apiService = ref.watch(newsApiServiceProvider);
  return NewsRepositoryImpl(apiService);
}
