// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrdersResult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrdersSuccess<T> value) success,
    required TResult Function(OrdersError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrdersSuccess<T> value)? success,
    TResult? Function(OrdersError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrdersSuccess<T> value)? success,
    TResult Function(OrdersError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersResultCopyWith<T, $Res> {
  factory $OrdersResultCopyWith(
          OrdersResult<T> value, $Res Function(OrdersResult<T>) then) =
      _$OrdersResultCopyWithImpl<T, $Res, OrdersResult<T>>;
}

/// @nodoc
class _$OrdersResultCopyWithImpl<T, $Res, $Val extends OrdersResult<T>>
    implements $OrdersResultCopyWith<T, $Res> {
  _$OrdersResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrdersResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OrdersSuccessImplCopyWith<T, $Res> {
  factory _$$OrdersSuccessImplCopyWith(_$OrdersSuccessImpl<T> value,
          $Res Function(_$OrdersSuccessImpl<T>) then) =
      __$$OrdersSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$OrdersSuccessImplCopyWithImpl<T, $Res>
    extends _$OrdersResultCopyWithImpl<T, $Res, _$OrdersSuccessImpl<T>>
    implements _$$OrdersSuccessImplCopyWith<T, $Res> {
  __$$OrdersSuccessImplCopyWithImpl(_$OrdersSuccessImpl<T> _value,
      $Res Function(_$OrdersSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of OrdersResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$OrdersSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$OrdersSuccessImpl<T> implements OrdersSuccess<T> {
  _$OrdersSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'OrdersResult<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of OrdersResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersSuccessImplCopyWith<T, _$OrdersSuccessImpl<T>> get copyWith =>
      __$$OrdersSuccessImplCopyWithImpl<T, _$OrdersSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrdersSuccess<T> value) success,
    required TResult Function(OrdersError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrdersSuccess<T> value)? success,
    TResult? Function(OrdersError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrdersSuccess<T> value)? success,
    TResult Function(OrdersError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class OrdersSuccess<T> implements OrdersResult<T> {
  factory OrdersSuccess(final T data) = _$OrdersSuccessImpl<T>;

  T get data;

  /// Create a copy of OrdersResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrdersSuccessImplCopyWith<T, _$OrdersSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrdersErrorImplCopyWith<T, $Res> {
  factory _$$OrdersErrorImplCopyWith(_$OrdersErrorImpl<T> value,
          $Res Function(_$OrdersErrorImpl<T>) then) =
      __$$OrdersErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$OrdersErrorImplCopyWithImpl<T, $Res>
    extends _$OrdersResultCopyWithImpl<T, $Res, _$OrdersErrorImpl<T>>
    implements _$$OrdersErrorImplCopyWith<T, $Res> {
  __$$OrdersErrorImplCopyWithImpl(
      _$OrdersErrorImpl<T> _value, $Res Function(_$OrdersErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of OrdersResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$OrdersErrorImpl<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrdersErrorImpl<T> implements OrdersError<T> {
  _$OrdersErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'OrdersResult<$T>.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersErrorImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of OrdersResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersErrorImplCopyWith<T, _$OrdersErrorImpl<T>> get copyWith =>
      __$$OrdersErrorImplCopyWithImpl<T, _$OrdersErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrdersSuccess<T> value) success,
    required TResult Function(OrdersError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrdersSuccess<T> value)? success,
    TResult? Function(OrdersError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrdersSuccess<T> value)? success,
    TResult Function(OrdersError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class OrdersError<T> implements OrdersResult<T> {
  factory OrdersError(final String message) = _$OrdersErrorImpl<T>;

  String get message;

  /// Create a copy of OrdersResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrdersErrorImplCopyWith<T, _$OrdersErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
