import 'package:petadoption/core/dio/custom_request.dart';
import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/features/dashboard/data/data_source/dashboard_api_service.dart';
import 'package:petadoption/features/dashboard/data/models/animal_type/animal_type_model.dart';
import 'package:petadoption/features/dashboard/data/models/config/config_model.dart';
import 'package:petadoption/features/dashboard/data/models/pet/pet_model.dart';
import 'package:petadoption/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:petadoption/features/home/data/data_source/home_storage_service.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this._configApiService, this._homeStorageService);
  final DashboardApiService _configApiService;
  final HomeStorageService _homeStorageService;
  @override
  Future<DataState<List<ConfigModel>>> getConfiguration() async {
    return handleRequest(_configApiService.getConfigurations());
  }

  @override
  Future<DataState<List<PetModel>>> getPets() async {
    return handleRequest(_configApiService.getPets());
  }

  @override
  Future<void> logout() async {
    await _homeStorageService.removeAccount();
  }

  @override
  Future<DataState<List<AnimalTypeModel>>> getAnimalType() {
    return handleRequest(_configApiService.getAnimalType());
  }
}
