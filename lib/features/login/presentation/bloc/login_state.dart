part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInit extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoadingService extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel loginModel;
  LoginSuccess(this.loginModel);
}

class LoginError extends LoginState {
  final String error;
  LoginError(this.error);
}
