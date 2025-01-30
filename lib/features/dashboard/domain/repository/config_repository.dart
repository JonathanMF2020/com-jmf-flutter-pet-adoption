import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/features/dashboard/data/models/config_model.dart';

abstract class ConfigRepository {
  // API Methods
  Future<DataState<List<ConfigModel>>> getConfiguration();
}
