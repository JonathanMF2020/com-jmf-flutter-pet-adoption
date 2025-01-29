import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/features/login/data/models/dto/login_dto.dart';
import 'package:petadoption/features/login/data/models/login_model.dart';

abstract class LoginRepository {
  // API Methods
  Future<DataState<LoginModel>> register(LoginDto register);
}
