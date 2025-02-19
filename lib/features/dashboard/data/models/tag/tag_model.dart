import 'package:json_annotation/json_annotation.dart';
import 'package:petadoption/features/dashboard/domain/entities/tag_entity.dart';

part 'tag_model.g.dart';

@JsonSerializable()
class TagModel extends TagEntity {
  const TagModel(
      {required super.id, required super.name, required super.color});

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);

  Map<String, dynamic> toJson() => _$TagModelToJson(this);
}
