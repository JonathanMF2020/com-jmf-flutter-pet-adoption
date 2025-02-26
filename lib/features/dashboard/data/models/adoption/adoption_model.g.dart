// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adoption_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdoptionModel _$AdoptionModelFromJson(Map<String, dynamic> json) =>
    AdoptionModel(
      id: (json['id'] as num).toInt(),
      city: json['city'] as String,
      zip_code: json['zip_code'] as String,
    );

Map<String, dynamic> _$AdoptionModelToJson(AdoptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'city': instance.city,
      'zip_code': instance.zip_code,
    };
