import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/features/dashboard/data/models/config/config_model.dart';
import 'package:petadoption/features/dashboard/data/models/pet/pet_model.dart';

abstract class DashboardRepository {
  // API Methods
  Future<DataState<List<ConfigModel>>> getConfiguration();
  Future<DataState<List<PetModel>>> getPets();
}
