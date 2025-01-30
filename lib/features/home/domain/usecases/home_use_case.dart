import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/core/use_case/use_case.dart';
import 'package:petadoption/features/home/domain/repository/home_repository.dart';

class HomeUseCase implements UseCase<DataState<List<String>>, void> {
  HomeUseCase(this._homeRepository);
  final HomeRepository _homeRepository;

  @override
  Future<DataState<List<String>>> call({void params}) async {
    final data = await _homeRepository.getAccount();
    return data;
  }
}
