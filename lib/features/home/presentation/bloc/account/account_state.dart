part of 'account_bloc.dart';

@immutable
abstract class AccountState {}

class AccountInit extends AccountState {}

class AccountLoading extends AccountState {}

class AccountLoadingService extends AccountState {}

class AccountSuccess extends AccountState {
  final List<String> list;
  AccountSuccess(this.list);
}

class AccountUnLoad extends AccountState {}

class AccountError extends AccountState {
  final String error;
  AccountError(this.error);
}
