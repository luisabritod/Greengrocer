// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) => OrdersModel(
      id: json['id'] as String,
      createdDateTime: json['createdDateTime'] == null
          ? null
          : DateTime.parse(json['createdDateTime'] as String),
      overdueDateTime: DateTime.parse(json['due'] as String),
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      status: json['status'] as String,
      qrCodeImage: json['qrCodeImage'] as String,
      copyAndPaste: json['copiaecola'] as String,
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$OrdersModelToJson(OrdersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDateTime': instance.createdDateTime?.toIso8601String(),
      'due': instance.overdueDateTime.toIso8601String(),
      'items': instance.items,
      'status': instance.status,
      'qrCodeImage': instance.qrCodeImage,
      'copiaecola': instance.copyAndPaste,
      'total': instance.total,
    };
