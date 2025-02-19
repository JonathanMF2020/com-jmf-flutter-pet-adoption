import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/core/use_case/use_case.dart';
import 'package:petadoption/features/dashboard/data/models/pet/pet_model.dart';
import 'package:petadoption/features/dashboard/domain/repository/dashboard_repository.dart';

class GetPets implements UseCase<DataState<List<PetModel>>, void> {
  GetPets(this._homeRepository);
  final DashboardRepository _homeRepository;

  @override
  Future<DataState<List<PetModel>>> call({void params}) async {
    final data = await _homeRepository.getPets();
    return data;
  }
}
