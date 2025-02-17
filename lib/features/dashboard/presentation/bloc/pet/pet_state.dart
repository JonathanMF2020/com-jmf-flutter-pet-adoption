part of 'pet_bloc.dart';

sealed class PetState extends Equatable {
  const PetState();

  @override
  List<Object> get props => [];
}

final class PetInitial extends PetState {}

final class PetSuccess extends PetState {
  final List<PetModel> petModels;
  const PetSuccess(this.petModels);
}

final class PetError extends PetState {
  final String error;
  const PetError(this.error);
}

final class PetLoading extends PetState {}
