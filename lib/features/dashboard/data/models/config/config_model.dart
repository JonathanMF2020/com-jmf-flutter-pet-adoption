import 'package:json_annotation/json_annotation.dart';
import 'package:petadoption/features/dashboard/domain/entities/config_entity.dart';

part 'config_model.g.dart';

@JsonSerializable()
class ConfigModel extends ConfigEntity {
  const ConfigModel({required super.key, required super.value});

  factory ConfigModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigModelToJson(this);
}
