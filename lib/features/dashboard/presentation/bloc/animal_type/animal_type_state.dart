part of 'animal_type_bloc.dart';

sealed class AnimalTypeState extends Equatable {
  const AnimalTypeState();

  @override
  List<Object> get props => [];
}

final class AnimalTypeInitial extends AnimalTypeState {}

final class AnimalTypeSuccess extends AnimalTypeState {
  final List<AnimalTypeModel> animalTypes;
  const AnimalTypeSuccess(this.animalTypes);
}

final class AnimalTypeError extends AnimalTypeState {
  final String error;
  const AnimalTypeError(this.error);
}

final class AnimalTypeLoading extends AnimalTypeState {}
