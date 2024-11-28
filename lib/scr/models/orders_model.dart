// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:greengrocer/scr/models/models.dart';

part 'orders_model.g.dart';

@JsonSerializable()
class OrdersModel {
  String id;
  @JsonKey(name: 'createdAt')
  DateTime? createdDateTime;
  @JsonKey(name: 'due')
  DateTime overdueDateTime;
  @JsonKey(defaultValue: [])
  List<CartItemModel> items;
  String status;
  String qrCodeImage;
  @JsonKey(name: 'copiaecola')
  String copyAndPaste;
  double total;

  OrdersModel({
    required this.id,
    this.createdDateTime,
    required this.overdueDateTime,
    required this.items,
    required this.status,
    required this.qrCodeImage,
    required this.copyAndPaste,
    required this.total,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrdersModelToJson(this);

  @override
  String toString() {
    return 'OrdersModel(id: $id, createdDateTime: $createdDateTime, overdueDateTime: $overdueDateTime, items: $items, status: $status, qrCodeImage: $qrCodeImage, copyAndPaste: $copyAndPaste, total: $total)';
  }
}
