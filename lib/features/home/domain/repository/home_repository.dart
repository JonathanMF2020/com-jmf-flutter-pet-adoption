import 'package:petadoption/core/resources/data_state.dart';

abstract class HomeRepository {
  // API Methods
  Future<DataState<List<String>>> getAccount();
}
