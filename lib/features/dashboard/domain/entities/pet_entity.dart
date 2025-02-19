import 'package:equatable/equatable.dart';
import 'package:petadoption/features/dashboard/data/models/animal_type_model.dart';
import 'package:petadoption/features/dashboard/data/models/breed_model.dart';
import 'package:petadoption/features/dashboard/domain/entities/animal_type_entity.dart';
import 'package:petadoption/features/dashboard/domain/entities/breed_entity.dart';

class PetEntity extends Equatable {
  const PetEntity(
      {required this.id,
      required this.name,
      required this.age,
      required this.description,
      required this.filename,
      required this.path,
      required this.breed,
      required this.animal_type});

  final int id;
  final String name;
  final int age;
  final String description;
  final String filename;
  final String path;
  final BreedModel breed;
  final AnimalTypeModel animal_type;

  @override
  List<Object?> get props {
    return [id, name, age, description, filename, path, breed, animal_type];
  }
}
