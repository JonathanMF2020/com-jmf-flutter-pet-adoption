import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/features/home/data/data_source/home_storage_service.dart';
import 'package:petadoption/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._homeStorageService);
  final HomeStorageService _homeStorageService;

  @override
  Future<DataState<List<String>>> getAccount() async {
    final data = await _homeStorageService.getAccount();
    return DataSuccess(data);
  }
}
