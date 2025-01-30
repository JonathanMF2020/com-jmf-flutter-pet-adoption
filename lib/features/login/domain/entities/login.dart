// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity({required this.access_token, required this.token_type});

  final String access_token;
  final String token_type;

  @override
  List<Object?> get props {
    return [access_token, token_type];
  }
}
