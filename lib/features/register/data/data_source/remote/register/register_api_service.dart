import 'package:dio/dio.dart';
import 'package:petadoption/features/register/data/models/dto/register_dto.dart';
import 'package:petadoption/features/register/data/models/register_model.dart';
import 'package:retrofit/retrofit.dart';

part 'register_api_service.g.dart';

@RestApi()
abstract class RegisterApiService {
  factory RegisterApiService(Dio dio) = _RegisterApiService;

  @POST('auth/register')
  Future<HttpResponse<RegisterModel>> register(@Body() RegisterDto register);
}
