import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/core/use_case/use_case.dart';
import 'package:petadoption/features/dashboard/data/models/animal_type/animal_type_model.dart';
import 'package:petadoption/features/dashboard/domain/repository/dashboard_repository.dart';

class GetAnimalType implements UseCase<DataState<List<AnimalTypeModel>>, void> {
  GetAnimalType(this._configRepository);
  final DashboardRepository _configRepository;

  @override
  Future<DataState<List<AnimalTypeModel>>> call({void params}) async {
    final data = await _configRepository.getAnimalType();
    return data;
  }
}
