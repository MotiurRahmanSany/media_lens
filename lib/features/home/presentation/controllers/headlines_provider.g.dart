// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headlines_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Headlines)
const headlinesProvider = HeadlinesFamily._();

final class HeadlinesProvider
    extends $AsyncNotifierProvider<Headlines, List<Article>> {
  const HeadlinesProvider._({
    required HeadlinesFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'headlinesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$headlinesHash();

  @override
  String toString() {
    return r'headlinesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Headlines create() => Headlines();

  @override
  bool operator ==(Object other) {
    return other is HeadlinesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$headlinesHash() => r'913d617159a3af63f4cd5c2aeb289f6dd2c8c8da';

final class HeadlinesFamily extends $Family
    with
        $ClassFamilyOverride<
          Headlines,
          AsyncValue<List<Article>>,
          List<Article>,
          FutureOr<List<Article>>,
          String?
        > {
  const HeadlinesFamily._()
    : super(
        retry: null,
        name: r'headlinesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  HeadlinesProvider call({String? category}) =>
      HeadlinesProvider._(argument: category, from: this);

  @override
  String toString() => r'headlinesProvider';
}

abstract class _$Headlines extends $AsyncNotifier<List<Article>> {
  late final _$args = ref.$arg as String?;
  String? get category => _$args;

  FutureOr<List<Article>> build({String? category});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(category: _$args);
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
