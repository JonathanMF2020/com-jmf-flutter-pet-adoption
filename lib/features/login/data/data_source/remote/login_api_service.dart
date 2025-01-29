import 'package:dio/dio.dart';
import 'package:petadoption/core/constants/constants.dart';
import 'package:petadoption/features/login/data/models/login_model.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api_service.g.dart';

@RestApi(baseUrl: apiBaseURL)
abstract class LoginApiService {
  factory LoginApiService(Dio dio) = _LoginApiService;

  @POST('auth/login')
  @FormUrlEncoded()
  Future<HttpResponse<LoginModel>> login(
      @Part(name: 'grant_type') String grandType,
      @Part(name: 'username') String username,
      @Part(name: 'password') String password,
      @Header("Accept") String accept);
}
