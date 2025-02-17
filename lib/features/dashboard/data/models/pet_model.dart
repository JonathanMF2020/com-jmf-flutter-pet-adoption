import 'package:json_annotation/json_annotation.dart';
import 'package:petadoption/features/dashboard/domain/entities/pet_entity.dart';

part 'pet_model.g.dart';

@JsonSerializable()
class PetModel extends PetEntity {
  // ignore: non_constant_identifier_names
  const PetModel({required super.id, required super.age, required super.name});

  factory PetModel.fromJson(Map<String, dynamic> json) =>
      _$PetModelFromJson(json);

  Map<String, dynamic> toJson() => _$PetModelToJson(this);
}
