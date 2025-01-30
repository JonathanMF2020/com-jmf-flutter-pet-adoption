import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/features/home/domain/usecases/home_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.homeUseCase) : super(HomeLoading()) {
    on<CheckAccount>(onCheckHome);
  }
  final HomeUseCase homeUseCase;
  Future<void> onCheckHome(CheckAccount event, Emitter<HomeState> emit) async {
    emit(HomeLoadingService());
    final dataState = await homeUseCase();
    if (dataState is DataSuccess) {
      emit(HomeSuccess(dataState.data!));
    }

    if (dataState is DataFailed) {
      if (kDebugMode) {
        print("[Error] ${dataState.error.toString()}");
      }
      emit(HomeError(dataState.error!.message!));
    }
  }
}
