import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../common/services/news_api_service.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(Ref ref) {
  return Dio();
}

@riverpod
NewsApiService newsApiService(Ref ref) {
  final dio = ref.watch(dioProvider);
  return NewsApiService(dio);
}
