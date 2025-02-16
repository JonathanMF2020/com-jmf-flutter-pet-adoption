import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/features/dashboard/data/models/config_model.dart';
import 'package:petadoption/features/dashboard/domain/usecases/get_config.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this.dashboardUseCase) : super(DashboardLoading()) {
    on<LoadDashboard>(onLoadDashboard);
  }
  final GetConfig dashboardUseCase;

  Future<void> onLoadDashboard(
      LoadDashboard event, Emitter<DashboardState> emit) async {
    emit(DashboardLoadingService());
    final dataState = await dashboardUseCase();
    if (dataState is DataSuccess) {
      emit(DashboardSuccess(dataState.data!));
    }

    if (dataState is DataFailed) {
      if (kDebugMode) {
        print("[Error] ${dataState.error.toString()}");
      }
      emit(DashboardError(dataState.error!.message!));
    }
  }
}
