// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagModel _$TagModelFromJson(Map<String, dynamic> json) => TagModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      color: json['color'] as String,
    );

Map<String, dynamic> _$TagModelToJson(TagModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
    };
