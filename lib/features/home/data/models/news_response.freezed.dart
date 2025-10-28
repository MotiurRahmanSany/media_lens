// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsResponse {

 String get status; int get totalResults; List<Article> get articles;
/// Create a copy of NewsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsResponseCopyWith<NewsResponse> get copyWith => _$NewsResponseCopyWithImpl<NewsResponse>(this as NewsResponse, _$identity);

  /// Serializes this NewsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other.articles, articles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,totalResults,const DeepCollectionEquality().hash(articles));

@override
String toString() {
  return 'NewsResponse(status: $status, totalResults: $totalResults, articles: $articles)';
}


}

/// @nodoc
abstract mixin class $NewsResponseCopyWith<$Res>  {
  factory $NewsResponseCopyWith(NewsResponse value, $Res Function(NewsResponse) _then) = _$NewsResponseCopyWithImpl;
@useResult
$Res call({
 String status, int totalResults, List<Article> articles
});




}
/// @nodoc
class _$NewsResponseCopyWithImpl<$Res>
    implements $NewsResponseCopyWith<$Res> {
  _$NewsResponseCopyWithImpl(this._self, this._then);

  final NewsResponse _self;
  final $Res Function(NewsResponse) _then;

/// Create a copy of NewsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? totalResults = null,Object? articles = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,articles: null == articles ? _self.articles : articles // ignore: cast_nullable_to_non_nullable
as List<Article>,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsResponse].
extension NewsResponsePatterns on NewsResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsResponse value)  $default,){
final _that = this;
switch (_that) {
case _NewsResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _NewsResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  int totalResults,  List<Article> articles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsResponse() when $default != null:
return $default(_that.status,_that.totalResults,_that.articles);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  int totalResults,  List<Article> articles)  $default,) {final _that = this;
switch (_that) {
case _NewsResponse():
return $default(_that.status,_that.totalResults,_that.articles);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  int totalResults,  List<Article> articles)?  $default,) {final _that = this;
switch (_that) {
case _NewsResponse() when $default != null:
return $default(_that.status,_that.totalResults,_that.articles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsResponse implements NewsResponse {
  const _NewsResponse({required this.status, required this.totalResults, required final  List<Article> articles}): _articles = articles;
  factory _NewsResponse.fromJson(Map<String, dynamic> json) => _$NewsResponseFromJson(json);

@override final  String status;
@override final  int totalResults;
 final  List<Article> _articles;
@override List<Article> get articles {
  if (_articles is EqualUnmodifiableListView) return _articles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_articles);
}


/// Create a copy of NewsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsResponseCopyWith<_NewsResponse> get copyWith => __$NewsResponseCopyWithImpl<_NewsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other._articles, _articles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,totalResults,const DeepCollectionEquality().hash(_articles));

@override
String toString() {
  return 'NewsResponse(status: $status, totalResults: $totalResults, articles: $articles)';
}


}

/// @nodoc
abstract mixin class _$NewsResponseCopyWith<$Res> implements $NewsResponseCopyWith<$Res> {
  factory _$NewsResponseCopyWith(_NewsResponse value, $Res Function(_NewsResponse) _then) = __$NewsResponseCopyWithImpl;
@override @useResult
$Res call({
 String status, int totalResults, List<Article> articles
});




}
/// @nodoc
class __$NewsResponseCopyWithImpl<$Res>
    implements _$NewsResponseCopyWith<$Res> {
  __$NewsResponseCopyWithImpl(this._self, this._then);

  final _NewsResponse _self;
  final $Res Function(_NewsResponse) _then;

/// Create a copy of NewsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? totalResults = null,Object? articles = null,}) {
  return _then(_NewsResponse(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,articles: null == articles ? _self._articles : articles // ignore: cast_nullable_to_non_nullable
as List<Article>,
  ));
}


}

// dart format on
