import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  const RegisterEntity({required this.message});

  final String message;

  @override
  List<Object?> get props {
    return [message];
  }
}
