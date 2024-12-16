// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModels _$ItemModelsFromJson(Map<String, dynamic> json) => ItemModels(
      id: json['id'] as String? ?? '',
      itemName: json['title'] as String,
      imgUrl: json['picture'] as String,
      unit: json['unit'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$ItemModelsToJson(ItemModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.itemName,
      'picture': instance.imgUrl,
      'unit': instance.unit,
      'price': instance.price,
      'description': instance.description,
    };
