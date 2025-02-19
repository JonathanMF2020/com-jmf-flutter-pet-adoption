import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/core/exception/token_exception.dart';
import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/features/dashboard/data/models/pet/pet_model.dart';
import 'package:petadoption/features/dashboard/domain/usecases/get_pets.dart';
import 'package:petadoption/features/dashboard/domain/usecases/logout.dart';

part 'pet_event.dart';
part 'pet_state.dart';

class PetBloc extends Bloc<PetEvent, PetState> {
  PetBloc(this.getPets, this.logout) : super(PetLoading()) {
    on<GetPetsEvent>(onGetPets);
  }
  final GetPets getPets;
  final Logout logout;

  Future<void> onGetPets(GetPetsEvent event, Emitter<PetState> emit) async {
    try {
      emit(PetLoading());
      final dataState = await getPets();
      if (dataState is DataSuccess) {
        if (dataState.data!.isEmpty) {
          emit(const PetError("There are no pets for adoption", 0));
        } else {
          emit(PetSuccess(dataState.data!));
        }
      }
      if (dataState is DataFailed) {
        if (kDebugMode) {
          print("[Error] ${dataState.error.toString()}");
        }
        emit(PetError(dataState.error!.message!, 0));
      }
    } on TokenException catch (e) {
      await logout();
      emit(PetError(e.error, 1));
    } on DioException catch (e) {
      await logout();
      emit(PetError(e.error.toString(), 1));
    }
  }
}
