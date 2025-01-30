import 'package:dio/dio.dart';
import 'package:petadoption/core/constants/constants.dart';
import 'package:petadoption/features/dashboard/data/models/config_model.dart';
import 'package:retrofit/retrofit.dart';

part 'config_api_service.g.dart';

@RestApi(baseUrl: apiBaseURL)
abstract class ConfigApiService {
  factory ConfigApiService(Dio dio) = _ConfigApiService;

  @GET('auth/login')
  Future<HttpResponse<List<ConfigModel>>> getConfigurations();
}
