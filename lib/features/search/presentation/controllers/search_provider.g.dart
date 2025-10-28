// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchNews)
const searchNewsProvider = SearchNewsProvider._();

final class SearchNewsProvider
    extends $AsyncNotifierProvider<SearchNews, List<Article>> {
  const SearchNewsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchNewsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchNewsHash();

  @$internal
  @override
  SearchNews create() => SearchNews();
}

String _$searchNewsHash() => r'eed3b2daf67975149c02218363f3dd82e2066a6b';

abstract class _$SearchNews extends $AsyncNotifier<List<Article>> {
  FutureOr<List<Article>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Article>>, List<Article>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Article>>, List<Article>>,
              AsyncValue<List<Article>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
