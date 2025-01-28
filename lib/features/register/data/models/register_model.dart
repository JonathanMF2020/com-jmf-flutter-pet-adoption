import 'package:json_annotation/json_annotation.dart';
import 'package:petadoption/features/register/domain/entities/register.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel extends RegisterEntity {
  const RegisterModel({
    required super.message,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
}
