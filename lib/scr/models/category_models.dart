// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:greengrocer/scr/models/models.dart';

part 'category_models.g.dart';

@JsonSerializable()
class CategoryModels {
  String title;
  String id;
  @JsonKey(defaultValue: [])
  List<ItemModels> items;
  @JsonKey(defaultValue: 0)
  int pagination;
  CategoryModels({
    required this.title,
    required this.id,
    required this.items,
    required this.pagination,
  });

  factory CategoryModels.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelsFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelsToJson(this);

  @override
  String toString() {
    return 'CategoryModels(title: $title, id: $id, items: $items, pagination: $pagination)';
  }
}
