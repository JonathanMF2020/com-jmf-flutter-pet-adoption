part of 'account_bloc.dart';

@immutable
abstract class AccountEvent {}

// ignore: must_be_immutable
class CheckAccountEvent extends AccountEvent {}
