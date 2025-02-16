import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/features/register/data/models/dto/register_dto.dart';
import 'package:petadoption/features/register/data/models/register_model.dart';
import 'package:petadoption/features/register/domain/usecases/register.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this.registerUseCase) : super(RegisterLoading()) {
    on<RegisterLoginService>(onRegister);
  }
  final Register registerUseCase;

  Future<void> onRegister(
      RegisterLoginService event, Emitter<RegisterState> emit) async {
    emit(RegisterLoadingService());
    final dataState = await registerUseCase(params: event.registerDto);
    if (dataState is DataSuccess) {
      emit(RegisterSuccess(dataState.data!));
    }

    if (dataState is DataFailed) {
      if (kDebugMode) {
        print("[Error] ${dataState.error.toString()}");
      }
      emit(RegisterError(dataState.error!.message!));
    }
  }
}
