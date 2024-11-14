// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartResult<T> {
  T get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) sucess,
    required TResult Function(T data) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? sucess,
    TResult? Function(T data)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? sucess,
    TResult Function(T data)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartSucess<T> value) sucess,
    required TResult Function(CartError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartSucess<T> value)? sucess,
    TResult? Function(CartError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartSucess<T> value)? sucess,
    TResult Function(CartError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CartResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartResultCopyWith<T, CartResult<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartResultCopyWith<T, $Res> {
  factory $CartResultCopyWith(
          CartResult<T> value, $Res Function(CartResult<T>) then) =
      _$CartResultCopyWithImpl<T, $Res, CartResult<T>>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$CartResultCopyWithImpl<T, $Res, $Val extends CartResult<T>>
    implements $CartResultCopyWith<T, $Res> {
  _$CartResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartSucessImplCopyWith<T, $Res>
    implements $CartResultCopyWith<T, $Res> {
  factory _$$CartSucessImplCopyWith(
          _$CartSucessImpl<T> value, $Res Function(_$CartSucessImpl<T>) then) =
      __$$CartSucessImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$CartSucessImplCopyWithImpl<T, $Res>
    extends _$CartResultCopyWithImpl<T, $Res, _$CartSucessImpl<T>>
    implements _$$CartSucessImplCopyWith<T, $Res> {
  __$$CartSucessImplCopyWithImpl(
      _$CartSucessImpl<T> _value, $Res Function(_$CartSucessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CartResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$CartSucessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$CartSucessImpl<T> implements CartSucess<T> {
  _$CartSucessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'CartResult<$T>.sucess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartSucessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of CartResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartSucessImplCopyWith<T, _$CartSucessImpl<T>> get copyWith =>
      __$$CartSucessImplCopyWithImpl<T, _$CartSucessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) sucess,
    required TResult Function(T data) error,
  }) {
    return sucess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? sucess,
    TResult? Function(T data)? error,
  }) {
    return sucess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? sucess,
    TResult Function(T data)? error,
    required TResult orElse(),
  }) {
    if (sucess != null) {
      return sucess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartSucess<T> value) sucess,
    required TResult Function(CartError<T> value) error,
  }) {
    return sucess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartSucess<T> value)? sucess,
    TResult? Function(CartError<T> value)? error,
  }) {
    return sucess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartSucess<T> value)? sucess,
    TResult Function(CartError<T> value)? error,
    required TResult orElse(),
  }) {
    if (sucess != null) {
      return sucess(this);
    }
    return orElse();
  }
}

abstract class CartSucess<T> implements CartResult<T> {
  factory CartSucess(final T data) = _$CartSucessImpl<T>;

  @override
  T get data;

  /// Create a copy of CartResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartSucessImplCopyWith<T, _$CartSucessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartErrorImplCopyWith<T, $Res>
    implements $CartResultCopyWith<T, $Res> {
  factory _$$CartErrorImplCopyWith(
          _$CartErrorImpl<T> value, $Res Function(_$CartErrorImpl<T>) then) =
      __$$CartErrorImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$CartErrorImplCopyWithImpl<T, $Res>
    extends _$CartResultCopyWithImpl<T, $Res, _$CartErrorImpl<T>>
    implements _$$CartErrorImplCopyWith<T, $Res> {
  __$$CartErrorImplCopyWithImpl(
      _$CartErrorImpl<T> _value, $Res Function(_$CartErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CartResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$CartErrorImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$CartErrorImpl<T> implements CartError<T> {
  _$CartErrorImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'CartResult<$T>.error(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartErrorImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of CartResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartErrorImplCopyWith<T, _$CartErrorImpl<T>> get copyWith =>
      __$$CartErrorImplCopyWithImpl<T, _$CartErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) sucess,
    required TResult Function(T data) error,
  }) {
    return error(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? sucess,
    TResult? Function(T data)? error,
  }) {
    return error?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? sucess,
    TResult Function(T data)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartSucess<T> value) sucess,
    required TResult Function(CartError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartSucess<T> value)? sucess,
    TResult? Function(CartError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartSucess<T> value)? sucess,
    TResult Function(CartError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CartError<T> implements CartResult<T> {
  factory CartError(final T data) = _$CartErrorImpl<T>;

  @override
  T get data;

  /// Create a copy of CartResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartErrorImplCopyWith<T, _$CartErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
