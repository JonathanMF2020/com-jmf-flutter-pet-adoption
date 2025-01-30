import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/core/use_case/use_case.dart';
import 'package:petadoption/features/login/data/models/dto/login_dto.dart';
import 'package:petadoption/features/login/data/models/login_model.dart';
import 'package:petadoption/features/login/domain/repository/login_repository.dart';
import 'package:petadoption/injection_container.dart';

class LoginUseCase implements UseCase<DataState<LoginModel>, LoginDto> {
  LoginUseCase(this._loginRepository);
  final LoginRepository _loginRepository;

  @override
  Future<DataState<LoginModel>> call({LoginDto? params}) async {
    final data = await _loginRepository.register(params!);
    final fss = sl<FlutterSecureStorage>();
    fss.write(key: "TOKEN", value: data.data?.access_token);
    fss.write(key: "TYPE_TOKEN", value: data.data?.token_type);
    return data;
  }
}
