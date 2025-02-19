import 'package:json_annotation/json_annotation.dart';
import 'package:petadoption/features/dashboard/domain/entities/breed_entity.dart';

part 'breed_model.g.dart';

@JsonSerializable()
class BreedModel extends BreedEntity {
  const BreedModel({required super.id, required super.name});

  factory BreedModel.fromJson(Map<String, dynamic> json) =>
      _$BreedModelFromJson(json);

  Map<String, dynamic> toJson() => _$BreedModelToJson(this);
}
