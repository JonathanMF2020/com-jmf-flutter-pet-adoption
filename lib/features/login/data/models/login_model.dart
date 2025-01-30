import 'package:json_annotation/json_annotation.dart';
import 'package:petadoption/features/login/domain/entities/login.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends LoginEntity {
  // ignore: non_constant_identifier_names
  const LoginModel({required super.access_token, required super.token_type});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
