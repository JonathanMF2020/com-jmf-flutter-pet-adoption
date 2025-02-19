// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:petadoption/features/dashboard/data/models/animal_type/animal_type_model.dart';
import 'package:petadoption/features/dashboard/data/models/breed/breed_model.dart';
import 'package:petadoption/features/dashboard/data/models/tag/tag_model.dart';
import 'package:petadoption/features/dashboard/domain/entities/pet_entity.dart';

part 'pet_model.g.dart';

@JsonSerializable()
class PetModel extends PetEntity {
  const PetModel(
      {required super.id,
      required super.age,
      required super.name,
      required super.description,
      required super.filename,
      required super.path,
      required super.breed,
      required super.tags,
      required super.animal_type});

  factory PetModel.fromJson(Map<String, dynamic> json) =>
      _$PetModelFromJson(json);

  Map<String, dynamic> toJson() => _$PetModelToJson(this);
}
