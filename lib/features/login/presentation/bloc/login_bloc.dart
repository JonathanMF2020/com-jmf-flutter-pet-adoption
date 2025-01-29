import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/features/login/data/models/dto/login_dto.dart';
import 'package:petadoption/features/login/data/models/login_model.dart';
import 'package:petadoption/features/login/domain/usecases/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.registerUseCase) : super(LoginLoading()) {
    on<ClickButtonLoginService>(onLogin);
  }
  final LoginUseCase registerUseCase;

  Future<void> onLogin(
      ClickButtonLoginService event, Emitter<LoginState> emit) async {
    emit(LoginLoadingService());
    final dataState = await registerUseCase(params: event.loginDto);
    if (dataState is DataSuccess) {
      emit(LoginSuccess(dataState.data!));
    }

    if (dataState is DataFailed) {
      if (kDebugMode) {
        print("[Error] ${dataState.error.toString()}");
      }
      emit(LoginError(dataState.error!.message!));
    }
  }
}
