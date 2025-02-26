// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:petadoption/features/dashboard/data/models/adoption/adoption_model.dart';
import 'package:petadoption/features/dashboard/data/models/animal_type/animal_type_model.dart';
import 'package:petadoption/features/dashboard/data/models/breed/breed_model.dart';
import 'package:petadoption/features/dashboard/data/models/tag/tag_model.dart';

class PetEntity extends Equatable {
  const PetEntity(
      {required this.id,
      required this.name,
      required this.age,
      required this.description,
      required this.filename,
      required this.path,
      required this.breed,
      required this.tags,
      required this.gender,
      required this.weight,
      required this.animal_type,
      required this.adoption});

  final int id;
  final String name;
  final int age;
  final String description;
  final String? filename;
  final String? path;
  final BreedModel? breed;
  final int gender;
  final double weight;
  final List<TagModel>? tags;
  final AnimalTypeModel? animal_type;
  final AdoptionModel? adoption;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      age,
      description,
      filename,
      path,
      breed,
      animal_type,
      adoption
    ];
  }
}
