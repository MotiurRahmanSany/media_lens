import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/article.dart';

part 'news_response.freezed.dart';
part 'news_response.g.dart';

@freezed
abstract class NewsResponse with _$NewsResponse {
  const factory NewsResponse({
    required String status,
    required int totalResults,
    required List<Article> articles,
  }) = _NewsResponse;

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
}
