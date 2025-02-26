import 'package:dio/dio.dart';
import 'package:petadoption/features/dashboard/data/models/animal_type/animal_type_model.dart';
import 'package:petadoption/features/dashboard/data/models/config/config_model.dart';
import 'package:petadoption/features/dashboard/data/models/pet/pet_model.dart';
import 'package:retrofit/retrofit.dart';

part 'dashboard_api_service.g.dart';

@RestApi()
abstract class DashboardApiService {
  factory DashboardApiService(Dio dio) = _DashboardApiService;

  @GET('auth/login')
  Future<HttpResponse<List<ConfigModel>>> getConfigurations();

  @GET('adoptions/pets')
  Future<HttpResponse<List<PetModel>>> getPets();

  @GET('animal_type')
  Future<HttpResponse<List<AnimalTypeModel>>> getAnimalType();
}
