part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInit extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterLoadingService extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterModel registerModel;
  RegisterSuccess(this.registerModel);
}

class RegisterError extends RegisterState {
  final String error;
  RegisterError(this.error);
}
