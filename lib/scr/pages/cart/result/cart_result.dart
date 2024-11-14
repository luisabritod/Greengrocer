import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_result.freezed.dart';

@freezed
class CartResult<T> with _$CartResult<T> {
  factory CartResult.sucess(T data) = CartSucess;
  factory CartResult.error(T data) = CartError;
}
