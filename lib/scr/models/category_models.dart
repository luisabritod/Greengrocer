import 'package:json_annotation/json_annotation.dart';

part 'category_models.g.dart';

@JsonSerializable()
class CategoryModels {
  String title;
  String id;
  CategoryModels({
    required this.title,
    required this.id,
  });

  factory CategoryModels.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelsFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelsToJson(this);

  @override
  String toString() => 'CategoryModels(title: $title, id: $id)';
}
