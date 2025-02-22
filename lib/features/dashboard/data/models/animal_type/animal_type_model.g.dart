// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalTypeModel _$AnimalTypeModelFromJson(Map<String, dynamic> json) =>
    AnimalTypeModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      filename: json['filename'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$AnimalTypeModelToJson(AnimalTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'filename': instance.filename,
      'path': instance.path,
    };
