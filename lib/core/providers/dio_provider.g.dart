// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dio)
const dioProvider = DioProvider._();

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'a03da399b44b3740dc4fcfc6716203041d66ff01';

@ProviderFor(newsApiService)
const newsApiServiceProvider = NewsApiServiceProvider._();

final class NewsApiServiceProvider
    extends $FunctionalProvider<NewsApiService, NewsApiService, NewsApiService>
    with $Provider<NewsApiService> {
  const NewsApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'newsApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$newsApiServiceHash();

  @$internal
  @override
  $ProviderElement<NewsApiService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NewsApiService create(Ref ref) {
    return newsApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NewsApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NewsApiService>(value),
    );
  }
}

String _$newsApiServiceHash() => r'b25cea186e9d77b57d35d00055f981b2e1baef2c';
