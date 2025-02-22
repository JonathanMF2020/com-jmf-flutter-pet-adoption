part of 'animal_type_bloc.dart';

sealed class AnimalTypeEvent extends Equatable {
  const AnimalTypeEvent();

  @override
  List<Object> get props => [];
}

class GetAnimalTypeEvent extends AnimalTypeEvent {}
