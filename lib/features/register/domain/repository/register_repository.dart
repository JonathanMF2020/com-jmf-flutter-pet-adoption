import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/features/register/data/models/dto/register_dto.dart';
import 'package:petadoption/features/register/data/models/register_model.dart';

abstract class RegisterRepository {
  // API Methods
  Future<DataState<RegisterModel>> register(RegisterDto register);
}
