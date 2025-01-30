import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/features/home/data/data_source/home_storage_service.dart';
import 'package:petadoption/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._homeApiService);
  final HomeStorageService _homeApiService;

  @override
  Future<DataState<List<String>>> getAccount() async {
    final data = await _homeApiService.getAccount();
    return DataSuccess(data);
  }
}
