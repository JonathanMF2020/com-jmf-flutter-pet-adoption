import 'package:json_annotation/json_annotation.dart';
import 'package:petadoption/features/dashboard/domain/entities/adoption_entity.dart';

part 'adoption_model.g.dart';

@JsonSerializable()
class AdoptionModel extends AdoptionEntity {
  const AdoptionModel(
      {required super.id, required super.city, required super.zip_code});

  factory AdoptionModel.fromJson(Map<String, dynamic> json) =>
      _$AdoptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdoptionModelToJson(this);
}
