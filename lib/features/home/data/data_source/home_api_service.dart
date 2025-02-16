import 'package:dio/dio.dart';
import 'package:petadoption/core/constants/constants.dart';
import 'package:petadoption/features/home/data/models/pet_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: apiBaseURL)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET('pets')
  Future<HttpResponse<List<PetModel>>> getPets();
}
