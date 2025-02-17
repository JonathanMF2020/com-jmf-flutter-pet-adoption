part of 'pet_bloc.dart';

sealed class PetEvent extends Equatable {
  const PetEvent();

  @override
  List<Object> get props => [];
}

class GetPetsEvent extends PetEvent {}
