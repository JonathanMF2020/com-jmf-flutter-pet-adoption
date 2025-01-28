part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterLogin extends RegisterEvent {}

// ignore: must_be_immutable
class RegisterLoginService extends RegisterEvent {
  RegisterDto registerDto;
  RegisterLoginService(this.registerDto);
}
