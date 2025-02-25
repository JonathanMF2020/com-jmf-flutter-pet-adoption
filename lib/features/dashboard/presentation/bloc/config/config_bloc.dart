import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/features/dashboard/data/models/config/config_model.dart';
import 'package:petadoption/features/dashboard/domain/usecases/get_config.dart';

part 'config_event.dart';
part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigBloc(this.getConfig) : super(ConfigLoading()) {
    on<LoadConfig>(onLoadConfig);
  }
  final GetConfig getConfig;

  Future<void> onLoadConfig(LoadConfig event, Emitter<ConfigState> emit) async {
    emit(ConfigLoadingService());
    final dataState = await getConfig();
    if (dataState is DataSuccess) {
      emit(ConfigSuccess(dataState.data!));
    }

    if (dataState is DataFailed) {
      if (kDebugMode) {
        print("[Error] ${dataState.error.toString()}");
      }
      emit(ConfigError(dataState.error!.toString()));
    }
  }
}
