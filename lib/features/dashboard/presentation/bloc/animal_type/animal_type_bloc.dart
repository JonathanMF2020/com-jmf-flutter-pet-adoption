import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/core/exception/token_exception.dart';
import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/features/dashboard/data/models/animal_type/animal_type_model.dart';
import 'package:petadoption/features/dashboard/domain/usecases/get_animal_type.dart';
import 'package:petadoption/features/dashboard/domain/usecases/logout.dart';

part 'animal_type_event.dart';
part 'animal_type_state.dart';

class AnimalTypeBloc extends Bloc<AnimalTypeEvent, AnimalTypeState> {
  AnimalTypeBloc(this.getAnimalTypes, this.logout)
      : super(AnimalTypeLoading()) {
    on<GetAnimalTypeEvent>(onGetAnimalTypes);
  }
  final GetAnimalType getAnimalTypes;
  final Logout logout;

  Future<void> onGetAnimalTypes(
      GetAnimalTypeEvent event, Emitter<AnimalTypeState> emit) async {
    try {
      emit(AnimalTypeLoading());
      final dataState = await getAnimalTypes();
      if (dataState is DataSuccess) {
        if (dataState.data!.isEmpty) {
          emit(const AnimalTypeError("There are no AnimalTypes for adoption"));
        } else {
          emit(AnimalTypeSuccess(dataState.data!));
        }
      }
      if (dataState is DataFailed) {
        if (kDebugMode) {
          print("[Error] ${dataState.error.toString()}");
        }
        emit(AnimalTypeError(dataState.error!.message!));
      }
    } on TokenException catch (e) {
      await logout();
      emit(AnimalTypeError(e.error));
    } on DioException catch (e) {
      await logout();
      emit(AnimalTypeError(e.error.toString()));
    }
  }
}
