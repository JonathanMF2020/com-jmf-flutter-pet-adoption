import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/core/use_case/use_case.dart';
import 'package:petadoption/features/register/data/models/dto/register_dto.dart';
import 'package:petadoption/features/register/data/models/register_model.dart';
import 'package:petadoption/features/register/domain/repository/register_repository.dart';

class Register implements UseCase<DataState<RegisterModel>, RegisterDto> {
  Register(this._registerRepository);
  final RegisterRepository _registerRepository;

  @override
  Future<DataState<RegisterModel>> call({RegisterDto? params}) async {
    final data = await _registerRepository.register(params!);
    return data;
  }
}
