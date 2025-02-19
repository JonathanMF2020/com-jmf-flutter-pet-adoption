// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedModel _$BreedModelFromJson(Map<String, dynamic> json) => BreedModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$BreedModelToJson(BreedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
