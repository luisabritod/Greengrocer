// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:greengrocer/scr/models/models.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItemModel {
  @JsonKey(name: 'product')
  ItemModels item;
  String id;
  int quantity;

  CartItemModel({
    required this.item,
    required this.id,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);

  double totalPrice() {
    return item.price * quantity;
  }

  @override
  String toString() =>
      'CartItemModel(item: $item, id: $id, quantity: $quantity)';
}
