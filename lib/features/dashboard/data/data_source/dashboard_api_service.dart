import 'package:dio/dio.dart';
import 'package:petadoption/core/constants/constants.dart';
import 'package:petadoption/features/dashboard/data/models/config_model.dart';
import 'package:petadoption/features/dashboard/data/models/pet_model.dart';
import 'package:retrofit/retrofit.dart';

part 'dashboard_api_service.g.dart';

@RestApi(baseUrl: apiBaseURL)
abstract class DashboardApiService {
  factory DashboardApiService(Dio dio) = _DashboardApiService;

  @GET('auth/login')
  Future<HttpResponse<List<ConfigModel>>> getConfigurations();

  @GET('pets')
  Future<HttpResponse<List<PetModel>>> getPets();
}
