import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/core/use_case/use_case.dart';
import 'package:petadoption/features/login/data/models/dto/login_dto.dart';
import 'package:petadoption/features/login/data/models/login_model.dart';
import 'package:petadoption/features/login/domain/repository/login_repository.dart';

class LoginUseCase implements UseCase<DataState<LoginModel>, LoginDto> {
  LoginUseCase(this._loginRepository);
  final LoginRepository _loginRepository;

  @override
  Future<DataState<LoginModel>> call({LoginDto? params}) async {
    final data = await _loginRepository.register(params!);
    return data;
  }
}
