part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

// ignore: must_be_immutable
class ClickButtonLoginService extends LoginEvent {
  LoginDto loginDto;
  ClickButtonLoginService(this.loginDto);
}
