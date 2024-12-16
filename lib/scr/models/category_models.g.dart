// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModels _$CategoryModelsFromJson(Map<String, dynamic> json) =>
    CategoryModels(
      title: json['title'] as String,
      id: json['id'] as String,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ItemModels.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      pagination: (json['pagination'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CategoryModelsToJson(CategoryModels instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'items': instance.items,
      'pagination': instance.pagination,
    };
