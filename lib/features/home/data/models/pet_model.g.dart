// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetModel _$PetModelFromJson(Map<String, dynamic> json) => PetModel(
      access_token: json['access_token'] as String,
      token_type: json['token_type'] as String,
    );

Map<String, dynamic> _$PetModelToJson(PetModel instance) => <String, dynamic>{
      'access_token': instance.access_token,
      'token_type': instance.token_type,
    };
