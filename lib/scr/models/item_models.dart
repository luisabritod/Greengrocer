import 'package:json_annotation/json_annotation.dart';

part 'item_models.g.dart';

@JsonSerializable()
class ItemModels {
  String id;
  @JsonKey(name: 'title')
  String itemName;
  @JsonKey(name: 'picture')
  String imgUrl;
  String unit;
  double price;
  String description;

  ItemModels({
    this.id = '',
    required this.itemName,
    required this.imgUrl,
    required this.unit,
    required this.price,
    required this.description,
  });

  factory ItemModels.fromJson(Map<String, dynamic> json) =>
      _$ItemModelsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemModelsToJson(this);
}
