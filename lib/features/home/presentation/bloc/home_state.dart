part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInit extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoadingService extends HomeState {}

class HomeSuccess extends HomeState {
  final List<String> list;
  HomeSuccess(this.list);
}

class HomeError extends HomeState {
  final String error;
  HomeError(this.error);
}
