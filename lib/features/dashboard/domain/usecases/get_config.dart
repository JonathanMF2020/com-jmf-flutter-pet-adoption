import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/core/use_case/use_case.dart';
import 'package:petadoption/features/dashboard/data/models/config/config_model.dart';
import 'package:petadoption/features/dashboard/domain/repository/dashboard_repository.dart';

class GetConfig implements UseCase<DataState<List<ConfigModel>>, void> {
  GetConfig(this._configRepository);
  final DashboardRepository _configRepository;

  @override
  Future<DataState<List<ConfigModel>>> call({void params}) async {
    final data = await _configRepository.getConfiguration();
    return data;
  }
}
