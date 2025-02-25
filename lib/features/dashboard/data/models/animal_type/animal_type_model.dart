import 'package:json_annotation/json_annotation.dart';
import 'package:petadoption/features/dashboard/domain/entities/animal_type_entity.dart';

part 'animal_type_model.g.dart';

@JsonSerializable()
class AnimalTypeModel extends AnimalTypeEntity {
  const AnimalTypeModel(
      {required super.id,
      required super.name,
      required super.filename,
      required super.path});

  factory AnimalTypeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimalTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimalTypeModelToJson(this);
}
