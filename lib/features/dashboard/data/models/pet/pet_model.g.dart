// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetModel _$PetModelFromJson(Map<String, dynamic> json) => PetModel(
      id: (json['id'] as num).toInt(),
      age: (json['age'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      filename: json['filename'] as String?,
      path: json['path'] as String?,
      breed: json['breed'] == null
          ? null
          : BreedModel.fromJson(json['breed'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => TagModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      animal_type: json['animal_type'] == null
          ? null
          : AnimalTypeModel.fromJson(
              json['animal_type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PetModelToJson(PetModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'description': instance.description,
      'filename': instance.filename,
      'path': instance.path,
      'breed': instance.breed,
      'tags': instance.tags,
      'animal_type': instance.animal_type,
    };
