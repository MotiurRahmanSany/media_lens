// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(newsRepository)
const newsRepositoryProvider = NewsRepositoryProvider._();

final class NewsRepositoryProvider
    extends $FunctionalProvider<NewsRepository, NewsRepository, NewsRepository>
    with $Provider<NewsRepository> {
  const NewsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'newsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$newsRepositoryHash();

  @$internal
  @override
  $ProviderElement<NewsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NewsRepository create(Ref ref) {
    return newsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NewsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NewsRepository>(value),
    );
  }
}

String _$newsRepositoryHash() => r'eef3184eb059ed0be30cdfd8357994012c4d9511';
